function [pos,xm,ym]=rk45(h,t0,tf)
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
% .  Function name: rk45.m
% . 
% .
% .  Author: Robert Ketchum                  
% .  
% .  Objective: This function solves an ODE using a fourth order
% .  Runge-Kutta method
% . 
% .  Inputs: h: the step size
% .          t0: the initial time
% .          tf: the final time
% .  
% .  Outputs: pos: a matrix with the solved positions and velocities at
% .                   all steps between t0 and tf
% .           xm: the x-position of the moon
% .           ym: the y-position of the moon
% .
% .  Functions Called: solver: which solves the equation
% .                    moon: which solves for the moon position
% . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

%creates the matrix for our position and velocity and sets up our
%initial positions
pos=zeros(4,3201);
pos(1,1)=8000;
pos(2,1)=0;
pos(3,1)=0;
pos(4,1)=5.5;

%sets up our vectors for the position of the moon and solves for initial
%position of the moon
xm=zeros(1,3201);
ym=zeros(1,3201);
[xm(1),ym(1)]=moon(t0);

%creates a counter for vector notation
count=1;

for t=t0+h:h:tf
   count=count+1;
   %solves for moon position
   [xm(count),ym(count)]=moon(t);
   
   %%%%%RK 45 START:
   
   %part 1: step back value (k0):
   k01=pos(1,count-1);
   k02=pos(2,count-1);
   k03=pos(3,count-1);
   k04=pos(4,count-1);
   
   %part 2: original prediction (k1):
   %solve for position, velocity of the satellite at a a time (t) using
   %position, velocity from (k0)
   [k11,k12,k13,k14]=solver(k01,k02,k03,k04,xm(count-1),ym(count-1));
   k11=k11*h;k12=k12*h;k13=k13*h;k14=k14*h;
   
   %part 3: correction 1 (k2):
   %correct original prediction (k1) using position, velocity (k1/2+k0)
   %at a time (t+h/2)
   [k21,k22,k23,k24]=solver(k01+k11/2,k02+k12/2,k03+k13/2,k04+k14/2, ...
       xm(count-1),ym(count-1));
   k21=k21*h;k22=k22*h;k23=k23*h;k24=k24*h;
   
   %part 4: correction 2 (k3):
   %correct prediction (k2) using position, velocity (k2/2+k0)
   %at a time (t+h/2)
   [k31,k32,k33,k34]=solver(k01+k21/2,k02+k22/2,k03+k23/2,k04+k24/2, ...
       xm(count-1),ym(count-1));
   k31=k31*h;k32=k32*h;k33=k33*h;k34=k34*h;
   
   %part 5: correction 3 (k4):
   %correct prediction (k3) using position, velocity (k3/2+k0)at
   %time (t+h)
   [k41,k42,k43,k44]=solver(k01+k31/2,k02+k32/2,k03+k33/2,k04+k34/2, ...
       xm(count-1),ym(count-1));
   k41=k41*h;k42=k42*h;k43=k43*h;k44=k44*h;
   
   %part 6: add up the (k) values to obtain our new position, velocity
   %values
   pos(1,count)=pos(1,count-1)+1/6*(k11+2*(k21+k31)+k41);
   pos(2,count)=pos(2,count-1)+1/6*(k12+2*(k22+k32)+k42);
   pos(3,count)=pos(3,count-1)+1/6*(k13+2*(k23+k33)+k43);
   pos(4,count)=pos(4,count-1)+1/6*(k14+2*(k24+k34)+k44);
end