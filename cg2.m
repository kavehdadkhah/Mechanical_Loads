function [ cgpoint ] = cg2(array)
% FINDS THE CG LOCATION 

cgpoint = zeros(3,1);

for i = 1:size(array,1)
    cgpoint(1) = cgpoint(1) + array(i,1)*array(i,2);
    cgpoint(2) = cgpoint(2) + array(i,1)*array(i,3);
    cgpoint(3) = cgpoint(3) + array(i,1)*array(i,4);    
end

cgpoint = cgpoint/sum(array(:,1));

end

