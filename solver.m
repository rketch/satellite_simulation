function [xdot,ydot,udot,vdot]=solver(x,y,u,v,xm,ym)
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  Function name: solver.m
% . 
% .
% .  Author: Robert Ketchum                  
% .  
% .  Objective: To solve the governing equations for a set time frame.
% . 
% .  Inputs: x: the x-position of the satellite at time (t-h) 
% .          y: the y-position of the satellite at time (t-h)
% .          u: the x-velocity of the satellite at time (t-h)
% .          v: the y-velocity of the satellite at time (t-h)
% .          xm: the x-position of the moon at time (t-h)
% .          ym: the y position of the moon at time (t-h)
% .  
% .  Outputs: xdot: the x-position of the satellite at time t
% .           ydot: the y-position of the satellite at time t
% .           udot: the x-velocity of the satellite at time t
% .           vdot: the y-velocity of the satellite at time t
% .
% .  Functions Called: None
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

%sets the gravitational constants for the planet and the moon
grave=200000;
gravm=20000;

%solves the position and velocity functions
xdot=u;
ydot=v;
udot=-grave*x/(x^2+y^2)^(3/2)-gravm*(x-xm)/((x-xm)^2+(y-ym)^2)^(3/2);
vdot=-grave*y/(x^2+y^2)^(3/2)-gravm*(y-ym)/((x-xm)^2+(y-ym)^2)^(3/2);
