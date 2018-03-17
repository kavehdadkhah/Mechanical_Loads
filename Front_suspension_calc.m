clear All;
clc;


Mass=[300]; %Mass of Solar car
W=Mass*9.81 ; %Weight of Solar Car
Bump_G_Force = [2];
Turn_G_Force =[1];
Brake_G_Force =[1];
N = ((Bump_G_Force + 0.25*Bump_G_Force)*W)/4 ; %Normal Force at front wheel
Ft = Turn_G_Force*W/4; %Turning Force
Fb = ((Brake_G_Force + 0.25*Brake_G_Force)*W)/4; %Break force

a = [0.0127]; %Horizontal between rod ends
b = [0.093218]; %horizontal top rod end to wheel
c = [0.089916]; %vertical between rod end
d = [0.491744]; %vertical bottom rod end to ground

%Top a-arm dimension
e = [0.191]; %horizontal Left Clevis from mid
f = [0.217]; %horizontal Right clevis from mid
g = [0.108]; %vertical from clevises to rod end
theta = [1.06465]; %left angle
alpha = [1.110029]; %right angle

%Bottom a-arm
x=[0.0878]; %clevis to shock
y=[0.0742]; %shock to rod end
h=[0.165]; %horizontal Left Clevis from mid
i=[0.221]; %horizontal Right clevis from mid
j = [0.131]; %vertical from clevises to rod end
sigma =[0.850341865]; %shock angle
beta=[0.8988446]; %left angle
gamma=[1.0472]; %right angle


%Bottom Rod Ends
Fbx = (N*(b-a)+Ft*(c+d))/c;
Fby = N;
Fbz = (Fb*(c+d))/c;

%Top Rod Ends
Ftx = ((N*(b-a))+(Ft*d))/c;
Ftz = (Fb*d)/c;

%Top Aarm (clevis forces)
Fe = ((Ftx*f)+(Ftz*g))/(cos(theta)*(e+f)); %Left clevis
Fex = Fe*cos(theta);
Fez = Fe*sin(theta);
Ff = ((Ftx*e)-(Ftz*g))/((cos(alpha)*(e+f))); %Right clevis
Ffx = Ff*cos(alpha);
Ffz = Ff*sin(alpha);

%Bottom Aarm
Fs = (Fby*(x+y))/(x*sin(sigma)); %Shock force 

Fia = (((Fs*cos(sigma)*h)+(Fbz*j)-Fbx*h))/((h+i)*cos(gamma)); %Left clevis
Fix = Fia*cos(gamma);
Fiz = Fia*sin(gamma);

Fha = (((Fs*cos(sigma)*i)-(Fbx*i)-(Fbz*j)))/((h+i)*cos(beta)); %Right clevis
Fhx = Fha*cos(beta);
Fhz = Fha*sin(beta);

Fhi = Fby - Fs*sin(beta); %Sum of h and i in y direction
Fhy = (Fhi*i)/(h+i);
Fiy = (Fhi*h)/(h+i);
