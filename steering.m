function [ us_angle ] = steering( wb, curvature )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ackerman = wb / curvature; 
slip_front =[];
slip_rear = [];
us_angle = ackerman + (slip_rear - slip_front);





end

