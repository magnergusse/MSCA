function posinicial(x)
    while x-RT060_GetPosition>10   
        RT060_SetMotorVoltage(3);
    end
    while RT060_GetPosition-x>10
        RT060_SetMotorVoltage(-3);
    end
    while (RT060_GetPosition > x+1|| RT060_GetPosition < x-1)  
       if RT060_GetPosition < x+0.2
            RT060_SetMotorVoltage(0.5);
            while RT060_GetPosition < x+0.2 && RT060_GetPosition~=300
            end
       end

       if RT060_GetPosition > x-0.2
            RT060_SetMotorVoltage(-0.5);
            while RT060_GetPosition > x-0.2 && RT060_GetPosition~=0
            end
       end
    end
    RT060_SetMotorVoltage(0);
end












