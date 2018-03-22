function [ moment ] = yaw_stability( cp, cg, stability_forces, wb, tw )
% CALCULATES TOTAL MOMENT APPLIED TO THE CAR. CAN BE USED FOR COMPARISON

moment = (stability_forces (1) * (cp(2)-cg(2))) + (stability_forces (2) * (cg(1)-cp(1))) + (stability_forces(3) * ((tw/2)-cg(1)));
%moment = sideway wind moment + drag moment + thrust moment




end

