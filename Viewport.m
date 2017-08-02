classdef Viewport
    %VIEWPORT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        width = 640
        height = 480
        camera_origin = [0;0;0]
        camera_direction = normalize([1;1;1])
        fov = 90 % in degrees
    end
        
    methods
        function ray_direction_vectors = generate_rays(self)
            fov_x = self.fov;
            fov_y = (self.height/self.width) * fov_x;
            
            % compute tangents of the fovs
            tan_fov_x = tan(deg2rad(fov_x));
            tan_fov_y = tan(deg2rad(fov_y));
            
            coordinate_xs = 0:(self.width - 1);
            coordinate_ys = 0:(self.height - 1);

            % convert to the basic top-down camera
            projected_xs = ((2 .* coordinate_xs - self.width) ./ self.width) .* tan_fov_x;
            projected_ys = ((2 .* coordinate_ys - self.height) ./ self.height) .* tan_fov_y;            
            
            % turn them into 3 x n vector
            [xs, ys] = meshgrid(projected_xs, projected_ys);
            raw_vectors = transpose([xs(:), ys(:), -ones(self.width * self.height, 1)]);
            
            % now rotate to match the camera
            rotate_matrix = self.camera_rotate_matrix;
            ray_direction_vectors = rotate_matrix * raw_vectors;
        end
        
        function r = camera_rotate_matrix(self)
            x = self.camera_direction(1);
            y = self.camera_direction(2);
            z = self.camera_direction(3);
            
            % r = I + vx + vx^2 * (1 - a.b)/||a x b||^2
            % where a = [x y z]^T, b = [0 0 -1]^T
            vx = [0  0  x;
                  0  0  y;
                 -x -y  0];
            r = eye(3) + vx + (vx^2) * ((1 - z)/(x^2 + y^2));
        end
    end
    
end

