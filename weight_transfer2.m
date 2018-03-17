function [ loads ] = weight_transfer2( static_loads, acc, cgz, cpz, wind_g_force, wb ,tw )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

%w = wind(4)/9.81;
%Wind_WT = (w*cpz)/tw;



Long_WT = (acc(2)*cgz)/wb;
Later_WT = (acc(3)*cgz)/tw;
Wind_WT = (cpz*wind_g_force/tw);


new_front = static_loads(1) + (Long_WT); %longitudinal transfer
new_rear = static_loads(2)-(Long_WT);
new_left = static_loads(3) + Later_WT + Wind_WT;  %lateral transfer
new_right = static_loads(4) - Later_WT -Wind_WT;

%weight at each wheel with load transfer [FL,FR,RL,RR]
loads = [new_front*new_left,new_front*new_right,new_rear*new_left,new_rear*new_right];


end

