%% exercicio 46

t=0:1e-3:10;
u=@(t) t>=0;

A=[0 1; 16 0];
B=[0;1];
C=[1 0];
D=0;

sys=ss(A,B,C,D);
lsim(sys, u(t),t)
step(sys, t)