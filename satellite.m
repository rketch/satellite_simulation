% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .
% .  File name: satellite.m
% .
% .  Author: Robert Ketchum
% .  
% .  Inputs: NA
% .  
% .  Outputs: NA
% .  
% .  Objective: This program solves the posit for the position and velocity of a
% .  spacecraft using the Runge-Kutta 45 method
% .  functions called: moon.m, to solve for the position of the moon. rk45, to
% .  solve the ODEs. solver.m, to solve the governing equations
% .  
% .  Functions called: moon.m, rk45.m, solver.m
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .


close all  % Close all files
clear all  % Clear all variables
clc        % Clear command line

%sets our initial and final time in seconds
t0=0;
tf=8000;

%sets our number of steps and step size
n=3200;
h=(tf-t0)/3200;

%solves for the position and the velocity of our satellite
%and the position of the moon
[pos,xm,ym]=rk45(h,t0,tf);


%creates a time vector
time=t0:h:tf;

%plotting
figure (1)
%plot the satellite's position
plot(pos(1,:),pos(2,:),'r');
hold on
%plot the moon's position
plot(xm,ym,'b')
%plot the surface of the planet
t=linspace(0,2*pi);
plot(5000*cos(t),5000*sin(t),'k');
title('Space: the final frontier')
ylabel('y-coordinates in kilometers')
xlabel('x-coordinates in kilometers')
legend('Path of the Starship Enterprise','path of the moon','Surface of Planet Vulcan')
hold off