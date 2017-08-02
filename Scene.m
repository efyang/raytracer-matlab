classdef Scene
    %SCENE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        material_objects = []
        lights = []
    end
    
    methods
        function image = render(viewport)
            rays = viewport.generate_rays();
        end
    end
    
end

