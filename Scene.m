classdef Scene < handle
    %SCENE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        material_objects = []
        lights = []
    end
    
    methods
        % render the image based on a viewport
        function image = render(self, viewport)
            image = zeros(viewport.height, viewport.width, 3);
            rays = viewport.generate_rays();
            
            %figure(1);
            %quiver3(viewport.origin(1)*ones(viewport.width*viewport.height, 1)',...
            %    viewport.origin(2)*ones(viewport.width*viewport.height, 1)',...
            %    viewport.origin(3)*ones(viewport.width*viewport.height, 1)',...
            %    rays(1, :)*10,...
            %    rays(2, :)*10,...
            %    rays(3, :)*10);
            %xlabel('x');
            %ylabel('y');
            %zlabel('z');
            
            % for each ray
                % for each object get intersections
            % apply rowfun for each ray
            % Format of ray vector:
            %| rx rx rx rx rx |
            %| ry ry ry ry ry |
            %| rz rz rz rz rz |
            for ray = rays
                for object = self.material_objects
                    [intersect, t] = object.ray_intersect(viewport.origin, ray);
                    %if intersect
                    %    disp('intersect');
                    %end
                    %disp(intersect);
                    %disp(t);
                end
            end
        end
        
        % add an object
        function [] = add_object(self, object)
            self.material_objects = [self.material_objects object];
        end
        
        % add a light
        function [] = add_light(self, light)
            self.lights = [self.lights light];
        end
        
        % check if ray intersects with any objects and get color at ray
        function [] = get_color(self, ray_orig, ray_direction)
        end
    end
    
end

