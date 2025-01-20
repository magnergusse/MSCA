% 2.2
clc; clear all;
h = 0.2; 
tf = 20;
Tamostragem = 0;    
kp=0.035;
ki=0.13;
kd=0.00255;
VREF=20;
e = [1:(tf/0.2+1)]; %erro
t = [1:(tf/0.2+1)]; %tempo
y = [1:(tf/0.2+1)]; %posiçao
v = zeros(1,(tf/0.2+1)); %velocidade
T = [1:(tf/0.2+1)]; %tensao
i=1;
posinicial(0);
tic
while toc<=tf+0.1 % precaver o calculo da ultima amostra
    if toc >= Tamostragem
            t(i)=toc;
            y(i)=RT060_GetPosition;
       if toc<=10 && toc>5
            VREF=30;
       elseif toc<=15 && toc>10
            VREF=-30;
       elseif toc<=20 && toc>15
            VREF=0;
       end

       if i==1
        T(i)= kp*(VREF)+ ki*(h/2)*(VREF)+ kd*(2/h)*(VREF);
       end

       if i>1 %&& toc>0.5 % toc>0.5 estabilização da velocidade
            v(i)=(y(i)-y(i-1))/(t(i)-t(i-1));
            e(i)=VREF-v(i-1);
                if i==2
                    T(i)=kp*(e(i))+ ki*(h/2)*(e(i)+2*e(i-1))+ kd*(2/h)*(e(i)-2*e(i-1));
                elseif i>2
                    T(i)= T(i-2) + kp*(e(i)-e(i-2))+ ki*(h/2)*(e(i)+2*e(i-1)+e(i-2))+ kd*(2/h)*(e(i)-2*e(i-1)+e(i-2));
                end
       end    
           Tamostragem = Tamostragem + h;  % Atualize o tempo de amostragem
      if T(i)>5
          T(i)=5;
      elseif T(i)<-5
          T(i)=-5;
      end
      RT060_SetMotorVoltage(T(i));
       i=i+1;
    end

end
%%
subplot(3,1,1)
plot(t,v)
xlabel("Tempo(s)");
ylabel("Velocidade(mm/s)");
title("Velocidade em função do tempo");
hold on
u = @(t) 20*(t>=0 & t<=5) + 30*(t>5 & t<=10) - 30*(t>10 & t<=15) + 0*(t>15);
t1= 0:1e-6:20;
plot(t1,u(t1));
legend('Real','Referência')
hold off
subplot(3,1,2)
plot(t,e)
xlabel("Tempo(s)");
ylabel("Erro(mm/s)");
title("Erro em função do tempo");
subplot(3,1,3)
plot(t,T)
xlabel("Tempo(s)");
ylabel("Tensão(V)");
title("Tensão em função do tempo");

