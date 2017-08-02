classdef Light < Object3D
    %LIGHT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        light_color = [1;1;1] % color of light - default white light - 3 vector
        light_intensity % amount of light that the light source emits
    end
    
    methods
        function li = light_intensity_at_point(self, distance_to_point)
            light_area = 4 * pi * distance_to_point ^ 2;
            li = self.light_intensity .* self.light_color ./ light_area;
        end
    end
    
end

