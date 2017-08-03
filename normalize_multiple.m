function [ v ] = normalize_multiple( v )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
    norms = sqrt(v(1,:).^2 + v(2,:).^2 + v(3,:).^2);
    v = v ./ norms;
end

