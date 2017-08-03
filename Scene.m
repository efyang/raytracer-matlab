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
            
            figure(1);
            quiver3(zeros(viewport.width*viewport.height, 1)', zeros(viewport.width*viewport.height, 1)', zeros(viewport.width*viewport.height, 1)', rays(1, :), rays(2, :), rays(3, :));
            xlabel('x');
            ylabel('y');
            zlabel('z');
            
            % for each ray
                % for each object get intersections
            % apply rowfun for each ray
            for ray = rays
                for object = self.material_objects
                    [intersect, t] = object.ray_intersect(viewport.origin, ray);
            %        disp(intersect);
            %        disp(t);
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

