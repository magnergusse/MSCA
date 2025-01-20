%Exercicio 12

h=0.04;
t=0:h:5;
x=sin(2*pi*t);
y=sin(10*pi*t)+cos(12*pi*t)+cos((14*pi*t)+(pi/4));
[yt,tt]=reconstroisinal(y,h);

plot (tt,yt, 'b',t,y,'r*');
grid on
axis tight;
xlabel('t')
ylabel('y')
legend('x(t)','x[n]')
%hold on
%plot (t,x);