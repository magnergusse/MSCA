% exercicio 35

M1=1;
M2=2;
K=1;
f1=0.8;
f2=0.8;
F=(t<0);
%% state space
A=[0 0 1 0; 0 0 0 1; -K/M1 K/M1 -f1/M1 0; K/M2 -K/M2 0 -f2/M2];
B=[0;0;1/M1;0];
C=[1 0 0 0; 0 1 0 0];
D=[0; 0];
sys= ss(A,B,C,D);%espaco de stados

%% força aplicada por 5segs
t=0:0.1:20;
u=@(t) t>=0;%definiçao do degrau unitario
mu=@(t) 2*u(t)-2*u(t-5);%definicao da soma dos 5 segs
lsim(sys, t, mu(t)w);

%% condicoes iniciais

y= lsim(sys, F, t, [0.8 0 0 0]);
plot(t, graph);
xlabel('t');
ylabel('x');
legend ('x1', 'x2')
%% 
syms K M1 M2 f1 f2 s
Es = inv(s*eye(4)-A)*[0.8 0 0 0];
limit(s*Es(1), s, 0)% tem que dar a expressaao