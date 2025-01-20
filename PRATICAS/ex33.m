%EX 33


u = @(t) t>=0;
B=[0; 2];
C=[1, 0];
D=0;

for K=[0.5, 1, 2]
    A=[0, 1; -K,-2];
    sys=ss(A,B,C,D);
    step(sys);
    hold on;
end
hold off;
legend('k=0.5','k=1','k=2'); % alteraçao da amplitude do sinal -menor execuçao + rapida
%% porto> benfica