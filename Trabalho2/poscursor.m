function [t,y,v]= poscursor(tensao,tf)
    Pamostragem = 0.2;  
    Tamostragem = 0;    
    i=1;
    RT060_SetMotorVoltage(tensao);
    t = [1:(tf/0.2+1)];
    y = [1:(tf/0.2+1)];
    v = zeros(1,(tf/0.2+1)); 
    tic
    while toc<=tf+0.1 % precaver o calculo da ultima amostra
       if toc >= Tamostragem
            t(i)=toc;
            y(i)=RT060_GetPosition;
            if i>1 
                v(i)=(y(i)-y(i-1))/(t(i)-t(i-1));
            end
           Tamostragem = Tamostragem + Pamostragem;  % Atualize o tempo de amostragem
             i=i+1;
       end
    end
    RT060_SetMotorVoltage(0); 
end