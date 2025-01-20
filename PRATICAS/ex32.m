%Exercicio 32
R=10;
L=1e-3;
Cap=1e-5;


A=[-1/(R*Cap) -1/Cap; 1/(L) 0];
B=[1/(R*Cap) ;0];
C=[1 0];
D=0;
sys = ss(A,B,C,D);
step(2*sys)
%% c)
t=0:1e-6:3e-3
u=@(t) t>=0;%definiçao do degrau unitario
mu=@(t) u(t)+u(t-0.5e-3)-2*u(t-1e-3);%definicao da soma e subtracao do vetor unitario ou seja os steps
lsim(sys, mu(t), t);


%% d)
A=[0 1; -1/(L*Cap) -1/(R*Cap)];
B=[0;1];
C=[0 ,1/(R*Cap)];
D=0;
sys =ss(A,B,C,D);
step(sys)