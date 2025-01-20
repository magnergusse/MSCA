clc; clear all;
x=10; %posição inicial
%Inicializaçao de todos os vetores necessários
y =[];
t =[];
v1=[];
v2=[];
v3=[];
v4=[];
Tensoes=[4 3 2 1];
i=1;
j=1;
k=1;
o=1;
posinicial(x);
pause(2);
Pamostragem = 0.2;  % P.amostragem = 0.2 segundos + tempo de execução
Tamostragem = 0;    % Tempo de amostragem 
tic
while toc<8 
    if toc >= Tamostragem
       t(i)=toc;
       y(i)=RT060_GetPosition;
        if toc <2
            RT060_SetMotorVoltage(4); 
            if i>1 && toc>0.5 % toc>0.5 estabilização da velocidade
                v1(i-1)=(y(i)-y(i-1))/(t(i)-t(i-1));
                V1 = mean(v1(v1 > 0));
            end
        end
        if toc <4 && toc>=2
            RT060_SetMotorVoltage(3);  
            if j>1
                v2(j-1)=(y(i)-y(i-1))/(t(i)-t(i-1));
                V2=mean(v2);
            end
            j=j+1;
        end

        if toc <6 && toc>=4
            RT060_SetMotorVoltage(2);  
            if k>1
                v3(k-1)=(y(i)-y(i-1))/(t(i)-t(i-1));
                V3=mean(v3);
            end
            k=k+1;
        end

        if toc <8 && toc>=6;
            RT060_SetMotorVoltage(1);  
            if o>1 && toc < 6.6;
                v4(o-1)=(y(i)-y(i-1))/(t(i)-t(i-1)); %% o ponteiro para em 6.6
                V4=mean(v4)
            end
            o=o+1;
        end
    Tamostragem = Tamostragem + Pamostragem;  % Atualiza T.amostragem
    i=i+1;
    end
end
RT060_SetMotorVoltage(0)
figure
plot(t,y-5.5)
xlabel('Tempo(s)');
ylabel('Posiçao(mm)');
title('1.2 Posição em função do tempo')
legend('Periodo de amostragem = 0.2s')
grid 
hold on
%%
V = cat(2,V1,V2,V3,V4);
figure
plot(Tensoes,abs(V),'.', 'MarkerSize', 20);
xlabel('Tensão(V)');
ylabel('Velocidade(mm/s)');




