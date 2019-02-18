function [xm,ym]=moon(t)
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  Function name: moon.m
% . 
% .
% .  Author: Robert Ketchum                  
% .  
% .  Objective: this function determines the position of the moon at
% .  time (t)
% . 
% .  Inputs: t: the current time
% .  
% .  Outputs: xm: the x-position of the moon
% .           ym: the y-position of the moon
% .
% .  Functions Called: None
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

%gravitational constant for moon
grave=200000;

%initial moon angle
theta0=pi/6;

%radius of moon in kilometers
rm=18000;

%angular velocity of the moon
omega=sqrt(grave/rm^3);

%finds the position of the moon in kilometers
xm=rm*cos(theta0+omega*t);
ym=rm*sin(theta0+omega*t);
