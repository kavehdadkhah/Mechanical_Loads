function [ static_loads ] = wheel_loads( cg, wb, tw )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

%vector = [((l-cgpoint(2))/l)*((t-cgpoint(1))/t),((l-cgpoint(2))/l)*(cgpoint(1)/t),(cgpoint(2)/l)*((t-cgpoint(1))/t),(cgpoint(2)/l)*(cgpoint(1)/t)];
static_loads = [((wb-cg(2))/wb),(cg(2)/wb),(((tw/2)-cg(1))/tw),(((tw/2)+cg(1))/tw)];
%Front, Rear, Left, Right

end

