% MAIN CODE

[front_geo,txt,raw] = xlsread('numbers1.xlsx', 'Sheet1');
[mass,txt,raw] = xlsread('numbers1.xlsx', 'Sheet5');

cg = cg2(mass); %x, y ,z cg
wb = 1.7; %Wheel base
tw = 1; %Track width
static_loads = wheel_loads(cg,wb,tw); %Front, Rear, Left, Right
acc = [3,1,0]; %bump, brake, turn
car_mass = sum(mass(:,1));

cp = [0.35,0.8,0.372];
stability_forces = [0,0,0]; %side_wind,drag,motor thrust
stable = yaw_stability(cp,cg,stability_forces,wb,tw);
wind_g_force = (stability_forces(3)/(car_mass*9.81));

loads = weight_transfer2(static_loads,acc,cg(3),cp(3),wind_g_force,wb,tw); %FL, FR, RL, RR

%Clevis Load calculations for each wheel
FL = front_calc(loads(1),front_geo,acc, car_mass);
FR = front_calc(loads(2),front_geo,acc, car_mass);

RL = rear_calc(loads(3),rear_geo,acc, car_mass);
RR = rear_calc(loads(4),rear_geo,acc, car_mass);

%Rod end selector and rod end mass calculator
[FLR, FLM] = rod_end(abs(FL),rod_end_geo,0.25);
[FRR, FRM] = rod_end(abs(FR),rod_end_geo,0.25);
[RLR, RLM] = rod_end_2(abs(RL),rod_end_geo,0.25);
[RRR, RRM] = rod_end_2(abs(RR),rod_end_geo,0.25);

%Clevis width calculator
%clevis_size = bolts(FL,rod_end_geo,FLR,170000);

%xlswrite('numbers.xlsx', [FLR,FRR], 'Sheet2', 'B2') 
%xlswrite('numbers.xlsx', [FL,FR], 'Sheet6') 
%xlswrite('numbers.xlsx', [RL,RR], 'Sheet4', 'B2') 



