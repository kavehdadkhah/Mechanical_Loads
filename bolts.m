function [ clevis_size ] = bolts( clevis_loads, rod_end_geo,rod, bolt_strenght)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
clevis_size = [];
width = 0;
for i=1:size(clevis_loads,1)
    force = sqrt((clevis_loads(i,1)^2+clevis_loads(i,2)^2))*0.22481;
    for y=1:size(rod_end_geo,1)
        if rod_end_geo(y,6) == rod(i)
            width = (bolt_strenght*pi*(rod_end_geo(y,9)^2)/(8*2.5*force))+(rod_end_geo(y,8)/2);
        end
        clevis_size(1,i) = width; %inches
    
    end
      
end    

end

