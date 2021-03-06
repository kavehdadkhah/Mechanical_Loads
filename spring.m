function [total_length, spring_rate] = spring( deflection, wheel_weight, wheel_travel , spring_travel, shock_travel, compression )
% SPRING RATE (CONSTANT) CALCULATOR

frequency = 188/(sqrt(deflection));
wheel_rate = (4*(pi^2)*(frequency^2)*wheel_weight)/(12*32.2);
IR = wheel_travel / spring_travel ; 
spring_rate = wheel_rate * ((IR)^2);

spring_force = compression * spring_rate;
wheel_preload = spring_force / IR;
additional_wheel = wheel_weight - wheel_preload;
additional_spring = additional_wheel * IR;
extra_length = additional_spring / spring_rate;
total_length = extra_length + shock_travel;

%NEED TO SOLVE FOR INSTALLATION RATIO%


end

