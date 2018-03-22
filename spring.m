function [ spring_rate ] = spring( deflection, weight, wheel_travel , spring_travel )
% SPRING RATE (CONSTANT) CALCULATOR

frequency = 188/(sqrt(deflection));

wheel_rate = (4*(pi^2)*(frequency^2)*weight)/(12*32.2);

IR = wheel_travel / spring_travel ; 

spring_rate = wheel_rate * ((IR)^2);


end

