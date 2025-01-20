%%ex 28
R=10;
L=1e-3;
C=10e-6;

s = tf ([1 0], 1)
Gs = (s/(R*C))/(s^2 +s/(R*C)+1/(L*C))

t=0:1e-3:10;
u=@(t) t>=0;

step(4*Gs)
hold on
%mu=@(t) u(t)+u(t-0.5e-3)-2*u(t-1e-3);