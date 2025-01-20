M=100;
f=80;
g=9.8;
Fp=1600;
T=20;


A=[0 1;0 -f/M];
B=[0;(Fp/M)-g];
C=[1 0];
D=0;
sys= ss(A,B,C,D);%espaco de stados

%% força aplicada por 20segs
t=0:0.1:800;
u=@(t) t>=0;%definiçao do degrau unitario
mu=@(t) Fp*u(t)-Fp*u(t-T);%definicao da soma dos 5 segs
lsim(sys, mu(t), t);
hold on
%plot(t,mu(t))

%%
syms M f g Fp T s
Es = inv(s*eye(4)-A);
limit(s*Es(1), s, 0)