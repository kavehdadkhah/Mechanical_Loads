function [ Clevis_force ] = rear_calc( loads,rear_geo, acc,W )
% REAR SUSPENSION LOAD CALCULATOR

Clevis_force = zeros(3,3);
N = acc(1) * loads *W * 9.81;
Fb = acc(2) * loads *W * 9.81;
Ft = acc(3) * loads *W * 9.81;

Fs = ((-Fb*rear_geo(6)) - (N*rear_geo(1))) / ((sin(rear_geo(9))*(rear_geo(1)-rear_geo(2)))+(cos(rear_geo(9))*rear_geo(3))); %Shock force
Faby = Fs*cos(rear_geo(9)) - Fb; %Sum of A and B  in x

%Top Shock Clevis
Fcy = Fs*cos(rear_geo(9)); %Clevis C x direction
Fcz = Fs*sin(rear_geo(9)); %Clevis C y direction

%Bottom Left Clevis
Faz = ((N*rear_geo(8))-(Ft*rear_geo(6))+ (Fcz*(rear_geo(4)-rear_geo(5))))/(rear_geo(4));
Fay = -1*((Faby)*(rear_geo(4)-rear_geo(5)))/rear_geo(4); %Clevis A x direction
Fax = Ft; %Clevis B y direction

%Bottom Right Clevis
Fbz = N-Faz+(Fcz); %Clevis B z direction
Fbx = Fax; %Clevis B y direction
Fby = -1*((Faby)*rear_geo(5))/rear_geo(4); %Clevis B x direction


Clevis_force(1,1:3) = [Fax,Fay,Faz];
Clevis_force(2,1:3) = [Fbx,Fby,Fbz];
Clevis_force(3,1:3) = [0,Fcy,Fcz];

end
