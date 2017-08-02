classdef MaterialObject < Object3D
    %MATERIALOBJECT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        albedo = 0.18 % default average for most objects
    end
    properties (Abstract)
        light_color
    end
    
    methods (Abstract)
        % Check if a ray intersects, and return the direction scale factor
        % t.
        function [intersects, t] = ray_intersect(self, ray_origin, ray_direction); end
        % get the direction vector of the normal on the surface
        function normal_direction = calculate_normal(self); end
        % get the color at the intersection
        function color = get_color(self, ray_origin, ray_direction, t); end
    end
end