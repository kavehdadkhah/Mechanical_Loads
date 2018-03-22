function [ us_angle ] = steering( wb, curvature )
% STEERING ANGLE CALCULATION

ackerman = wb / curvature; 
slip_front =0;
slip_rear = 0;
us_angle = ackerman + (slip_rear - slip_front);


end

