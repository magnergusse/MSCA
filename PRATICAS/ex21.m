% exercicio 21

t=0:0.1:10;
ut=t>=0;

for a =[0.1 1 10]
Y=(1-exp(-a*t));
plot(t,Y );
hold on
end

hold off
grid
xlabel('t[s]')
ylabel('y(t)')
legend ('a=0.1', 'a=1', 'a=10')