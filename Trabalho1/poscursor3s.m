function [t,y]= poscursor3s(tensao,tf);
    Pamostragem = 0.2;  
    Tamostragem = 0;    
    i=1;
    RT060_SetMotorVoltage(tensao);
    tic
    while toc<tf
       if toc >= Tamostragem
            t(i)=toc;
            y(i)=RT060_GetPosition;
           Tamostragem = Tamostragem + Pamostragem;  % Atualize o tempo de amostragem
             i=i+1;
       end
    end
    RT060_SetMotorVoltage(0); 
end