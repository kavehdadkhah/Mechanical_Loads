function [ moment ] = yaw_stability( cp, cg, stability_forces, wb, tw )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

moment = (stability_forces (1) * (cp(2)-cg(2))) + (stability_forces (2) * (cg(1)-cp(1))) + (stability_forces(3) * ((tw/2)-cg(1)));
%moment = sideway wind moment + drag moment + thrust moment




end

