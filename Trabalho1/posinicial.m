function posinicial(x)
    RT060_SetMotorVoltage(5);
    pause(1);
    while RT060_GetPosition> 0 %posiçao 0 da régua graduada
        RT060_SetMotorVoltage(-1);
    end
    pause(1)
    while  RT060_GetPosition <x-5.5% posiçao calibrada na regua graduada
        RT060_SetMotorVoltage(1);
    end
        RT060_SetMotorVoltage(0);
end














