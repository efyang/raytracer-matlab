classdef Viewport
    %VIEWPORT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        width = 100
        height = 75
        origin = [0 0 0]'
        yaw = deg2rad(45)
        pitch = deg2rad(0)
        roll = deg2rad(45)
        fov = 45 % in degrees
    end
        
    methods
        function ray_direction_vectors = generate_rays(self)
            fov_x = self.fov;
            fov_y = (self.height/self.width) * fov_x;
            
            % compute tangents of the fovs
            tan_fov_x = tan(deg2rad(fov_x/2));
            tan_fov_y = tan(deg2rad(fov_y/2));
            
            coordinate_xs = 0.5:(self.width - 0.5);
            coordinate_ys = 0.5:(self.height - 0.5);

            % convert to the basic top-down camera
            projected_xs = ((2 .* coordinate_xs - self.width) ./ self.width) .* tan_fov_x;
            projected_ys = ((2 .* coordinate_ys - self.height) ./ self.height) .* tan_fov_y;            
            
            % turn them into 3 x n vector
            [xs, ys] = meshgrid(projected_xs, projected_ys);
            raw_vectors = normalize_multiple([xs(:), ys(:), -ones(self.width * self.height, 1)]');
            
            % now rotate to match the camera
            rotate_matrix = self.camera_rotate_matrix();
            ray_direction_vectors = normalize_multiple(rotate_matrix * raw_vectors);
        end
        
        function r = camera_rotate_matrix(self)
            cosyaw = cos(self.yaw);
            sinyaw = sin(self.yaw);
            cospitch = cos(self.pitch);
            sinpitch = sin(self.pitch);
            cosroll = cos(self.roll);
            sinroll = sin(self.roll);
            
            yawm = [cosyaw -sinyaw 0;
                    sinyaw cosyaw  0;
                    0 0 1];
            pitchm = [cospitch 0 sinpitch;
                      0 1 0;
                      -sinpitch 0 cospitch];
            rollm = [1 0 0;
                     0 cosroll -sinroll;
                     0 sinroll cosroll];
            r = yawm * pitchm * rollm;
        end
    end
    
end

