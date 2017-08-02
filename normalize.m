function [ v ] = normalize( v )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
    v = v ./ norm(v);
end

