classdef AABB < MaterialObject
    %AABB Summary of this class goes here
    %   Detailed explanation goes here

    properties
        endpoint % the other endpoint - AABB is defined by two endpoints, position is one of them
        center
    end

    methods
        function obj = AABB(min_point, max_point, color)
            obj.position = min_point;
            obj.endpoint = max_point;
            obj.center = mean([min_point max_point], 2);
            obj.base_color = color;
        end

        % check if a ray intersects with the box, and if it does, return
        % the t value that lets the ray intersect.
        function [intersects, t] = ray_intersect(self, ray_origin, ray_direction)
            ta = (self.position - ray_origin) ./ ray_direction;
            tb = (self.endpoint - ray_origin) ./ ray_direction;

            tmin = max(min(ta, tb));
            tmax = min(max(ta, tb));

            % no intersection or behind camera
            if tmax < 0 || tmin > tmax
                intersects = false;
                t = tmax;
            else
                intersects = true;
                t = tmin;
            end
        end

        % get the direction vector of the normal on the surface
        function normal_direction = calculate_normal(self,isect_point)
            % vector from center to hit
            p = isect_point - self.center;
            d = abs(self.position - self.endpoint) ./ 2;
            normal_direction = normalize(floor(p ./ d));
        end
        % get the color at the intersection
        function color = get_color(self, ray_origin, ray_direction, t)

        end
    end

end

