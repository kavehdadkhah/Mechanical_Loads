function [ Clevis_Forces ] = front_calc( loads,front_geo, acc,W)
% FRONT SUSPENSION LOAD CALCULATOR

Clevis_Forces = zeros(5,3);
N = acc(1) * loads *W * 9.81;
Fb = acc(2) * loads *W * 9.81;
Ft = acc(3) * loads *W * 9.81;

%Top Rod Ends
Ftx = ((Ft*front_geo(4))-(N*(front_geo(2)-front_geo(1))))/front_geo(3);
Fty = (Fb*front_geo(4))/front_geo(3);

%Bottom Rod Ends
Fbx = ((Ft*(front_geo(4)+front_geo(3)))-(N*(front_geo(2)-front_geo(1))))/front_geo(3);
Fby = (Fb*(front_geo(3)+front_geo(4)))/front_geo(3);
Fbz = N;

%Top Left Clevis

% DOUBLE WISHBONE: 
% Fe = ((Ftx*front_geo(6))+(Fty*front_geo(7)))/(cos(front_geo(13))*(front_geo(5)+front_geo(6))); %Left clevis
% Fex = Fe*cos(front_geo(13));
% Fey = Fe*sin(front_geo(13));

% LEADING ARM: 
Fe = ((Ftx*front_geo(7))+(Fty*front_geo(6)))/(cos(front_geo(13))*(front_geo(5)+front_geo(6))); %Left clevis
Fex = Fe*sin(front_geo(13));
Fey = Fe*cos(front_geo(13));


%Top Right Clevis
% DOUBLE WISHBONE: 
% Ff = ((Ftx*front_geo(5))-(Fty*front_geo(7)))/((cos(front_geo(14))*(front_geo(5)+front_geo(6)))); %Right clevis
% Ffx = Ff*cos(front_geo(14));
% Ffy = Ff*sin(front_geo(14));

% LEADING ARM: 
Ff = ((Ftx*front_geo(7))-(Fty*front_geo(5)))/((cos(front_geo(14))*(front_geo(5)+front_geo(6)))); %Right clevis
Ffx = Ff*sin(front_geo(14));
Ffy = Ff*cos(front_geo(14));


%Spring 
if front_geo(9)~=0
    Fs = (Fbz*(front_geo(8)+front_geo(9)))/(front_geo(9)*sin(front_geo(15))); %Shock force 
else
    Fs = Fbz / sin(front_geo(15));
end

Fsx = Fs*cos(front_geo(15));
Fsz = Fs*sin(front_geo(15));

Fhi = Fsz-Fbz;

%Bottom Right Clevis

% DOUBLE WISHBONE: 
% Fia = (((Fs*cos(front_geo(15))*front_geo(10))+(Fby*front_geo(12))-Fbx*front_geo(10)))/((front_geo(10)+front_geo(11))*cos(front_geo(17))); %Left clevis
% Fix = Fia*cos(front_geo(17));
% Fiy = Fia*sin(front_geo(17));

% LEADING ARM:
Fia = (((Fs*cos(front_geo(15))*front_geo(10))+(Fby*front_geo(10))-Fbx*front_geo(12)))/((front_geo(10)+front_geo(11))*cos(front_geo(17))); %Left clevis
Fix = Fia*sin(front_geo(17));
Fiy = Fia*cos(front_geo(17));
Fiz = (Fhi*front_geo(10))/(front_geo(10)+front_geo(11));

%Bottom Left Clevis

% DOUBLE WISHBONE: 
% Fha = (((Fs*cos(front_geo(15))*front_geo(11))-(Fbx*front_geo(11))-(Fby*front_geo(12))))/((front_geo(10)+front_geo(11))*cos(front_geo(16))); %Right clevis
% Fhx = Fha*cos(front_geo(16));
% Fhy = Fha*sin(front_geo(16));

% LEADING ARM:
Fha = (((Fs*cos(front_geo(15))*front_geo(11))-(Fbx*front_geo(12))-(Fby*front_geo(11))))/((front_geo(10)+front_geo(11))*cos(front_geo(16))); %Right clevis
Fhx = Fha*sin(front_geo(16));
Fhy = Fha*cos(front_geo(16));
Fhz = (Fhi*front_geo(11))/(front_geo(10)+front_geo(11));


Clevis_Forces(1,1:3) = [Fex,Fey,0];
Clevis_Forces(2,1:3) = [Ffx,Ffy,0];
Clevis_Forces(3,1:3) = [Fhx,Fhy,Fhz];
Clevis_Forces(4,1:3) = [Fix,Fiy,Fiz];

Clevis_Forces(5,1:3) = [Ftx,Fty,0];
Clevis_Forces(6,1:3) = [Fbx,Fby,Fbz];

Clevis_Forces(7,1:3) = [Fsx,0,Fsz];

end

