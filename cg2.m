function [ cgpoint ] = cg2(array)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
cgpoint = zeros(3,1);

for i = 1:size(array,1)
    cgpoint(1) = cgpoint(1) + array(i,1)*array(i,2);
    cgpoint(2) = cgpoint(2) + array(i,1)*array(i,3);
    cgpoint(3) = cgpoint(3) + array(i,1)*array(i,4);    
end


cgpoint = cgpoint/sum(array(:,1));
%cgpoint(3) = cgpoint(3) + 0.2794;


%Weight at each wheel

end

