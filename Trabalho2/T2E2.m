% 2.1
clc; clear all;
h = 0.2;  
kp=0.035; 
ki=0.13; 
kd=0.00255; 

for j=1:3
    VREF=[20 40 60];
    tf=300/VREF(j); % Percursototal/velocidade
e = [1:round(tf/0.2+1)]; %erro
t = [1:round(tf/0.2+1)]; %tempo
y = [1:round(tf/0.2+1)]; %posiçao
v = zeros(1,round(tf/0.2+1)); %velocidade
T = [1:round(tf/0.2+1)]; %tensao

Tamostragem = 0;  
i=1;
posinicial(10);
tic
while toc<=tf+0.1 % precaver o calculo da ultima amostra
    if toc >= Tamostragem
            t(i)=toc;
            y(i)=RT060_GetPosition;
       if i==1
        T(i)= kp*(VREF(j))+ ki*(h/2)*(VREF(j))+ kd*(2/h)*(VREF(j));
       end

       if i>1 
            v(i)=(y(i)-y(i-1))/(t(i)-t(i-1));
            e(i)=VREF(j)-v(i-1);
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
figure;
plot(t,v)
xlabel("Tempo(s)");
ylabel("Velocidade(mm/s)");
title("Velocidade em função do tempo");
hold on
u = @(t) VREF(j)*(t>0 & t<tf);
t1= 0:1e-6:tf;
plot(t1,u(t1));
legend('Real','Referência')
hold off;
end
%%
%{
plot(t,v)
xlabel("Tempo(s)");
ylabel("Velocidade(mm/s)");
title("Velocidade em função do tempo");
figure;
plot(t,e)
xlabel("Tempo(s)");
ylabel("Erro(mm/s)");
title("Erro em função do tempo");
figure;
plot(t,T)
xlabel("Tempo(s)");
ylabel("Tensão(V)");
title("Tensão em função do tempo");
%}
