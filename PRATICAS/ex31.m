%Exercicio 31

M=1;
K=1;
for D= [1 2 4]
    A=[0 1;-K/M -D/M];
    B=[0;1];
    C=[1 0; 0 1];
    
    sys=ss(A,B,C,0);
    %step(sys,25)
    out = sim("EXE_31.slx");

    h1 =subplot(2,1,1);
    plot (out.tout, out.y(:,1))
    ylabel('y(t)')
    hold on
    grid on
    subplot(2,1,2)
    plot (out.tout, out.y(:,2))
    ylabel('$\dot{y}(t)$', 'Interpreter','latex')
    hold on
end


%set(h1, 'nextplot', 'replace') %igualar h1 a um dos subplots e vai fazer
%com que substitua o grafico que tinha antes

hold off
legend('D=1', 'D=2','D=4', 'location', 'best')
legend (h1,'D=1', 'D=2','D=4', 'location', 'best')