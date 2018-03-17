function [best_rod_end,sum] = rod_end( clevis_loads, rod_end_geo, jam_nut )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
best_rod_end = [];
sum = 0;
for i = 1:(size(clevis_loads,1))
    if i == 1||2||3
        axial = sqrt((clevis_loads(i,1)^2)+ (clevis_loads(i,2)^2));
        bending = clevis_loads(i,3);
    else
        axial = clevis_loads(i,1);
        bending = sqrt((clevis_loads(i,2)^2)+ (clevis_loads(i,3)^2));
    end
    rod_end_list = [];
    
    for x = 1:size(rod_end_geo,1)
        %stress = 0;
        A = rod_end_geo(x,4);
        d = (rod_end_geo(x,1)-rod_end_geo(x,2))+jam_nut+(3/rod_end_geo(x,3));
        stress = (32*abs(bending*0.22481)*d)/(pi*(rod_end_geo(x,5)^3))+((abs(axial)*0.22481)/A);
        if stress<68000
            rod_end_list(1,x) = rod_end_geo(x,6);
        else
            rod_end_list(1,x) = 1000;
        end
    end
    minimum = min(rod_end_list(1,:));
    for y = 1:size(rod_end_geo,1)
        if rod_end_geo(y,6) == minimum
            sum = sum+rod_end_geo(y,7);
        end
    end
    best_rod_end(i,:) = minimum;

end
end

