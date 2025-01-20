t=0:1e-3:30;
u=@(t) t>=0;
M=2;
K=10;
f=0.5;
g=9.8;

A=[0 1; -K/M -f/M];
B=[0;g];
C=[1 0];
D=[0];

sys=ss(A,B,C,D);
lsim(sys,u(t),t)