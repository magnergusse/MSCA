clc; clear all;
posinicial(150);
pause(2);
tensao=1.5;
[t1,y1]= poscursor3s(tensao,3);
plot(t1,y1-3);
xlabel('Tempo(s)');
ylabel('Posiçao(mm)');
grid
hold on;

pause(1)

posinicial(150);
pause(2);
tensao=2;
[t2,y2]= poscursor3s(tensao,3);
plot(t2,y2-3);


pause(1)

posinicial(150);
pause(2);
tensao=2.5;
[t3,y3]= poscursor3s(tensao,3);
plot(t3,y3-3);
pause(1)

posinicial(150);
pause(2);
tensao=3;
[t4,y4]= poscursor3s(tensao,3);
plot(t4,y4-3);
hold off;

%% Modelo 2.2
A = 0.02;
B = 14.2;
C = 1;
D = 0;
Init = 143; % 150 regua graduada
t=linspace(0,3,16);
tensoes=[1.5 2 2.5 3]
for i=1:4
    u=ones(1,16)*tensoes(i);
    sys= ss(A,B,C,D)
    hold on
    lsim(sys,u,t,Init)
    hold on
end

%% 2.3 maquina
posinicial(150);
pause(2);
[t1,y1]= poscursor3s(1.5,2);
[t2,y2]= poscursor3s(1.7,2);
[t3,y3]= poscursor3s(2,2);
t2=t2+2;
t3=t3+4;
t = horzcat(t1, t2, t3);
y = horzcat(y1, y2, y3)-3;
plot(t,y);
xlabel('Tempo(s)');
ylabel('Posiçao(mm)');
grid
%% Modelo 2.3
t = linspace(0, 6, 120);
tensoes = 1.5;
repeats = 40;  % Repetiçao de cada valor de tensao
u1 = repmat(tensoes, 1, repeats);
tensoes = 1.7;
u2 = repmat(tensoes, 1, repeats); 
tensoes = 2;
u3 = repmat(tensoes, 1, repeats); 
u= horzcat (u1,u2,u3);

sys= ss(A,B,C,D)
hold on
lsim(sys,u,t,Init)
