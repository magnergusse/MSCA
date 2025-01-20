v=zeros(31,5);
t=zeros(31,5);
for i=1:5
    posinicial(10)
    [t1,y1,v1]=poscursor(3,6);
    v(:,i)=v1;
    t(:,i)=t1;
end
%%
plot(t,v);
xlabel("Tempo(s)");
ylabel("Velocidade(mm/s)");
title ("Velocidade em função do tempo");
legend( "Exp1","Exp2","Exp3","Exp4","Exp5");
hold on;
figure;
%%
for i=1:5
    subplot(5,1,i)
    plot(t(:,i),v(:,i));
    xlabel("Tempo(s)");
    ylabel("Velocidade(mm/s)");
    title ("Velocidade em função do tempo");
    hold on;
end

