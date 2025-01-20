%exercicio 22

t=0:0.1:10;
ut=t>=0;
ab =[0.1 0.2;
    1 2;
    10 12];

for I = 1:size(ab,1)
    a = ab(I,1)
    b = ab(I,2)

    Y = (1+b.*exp(-a*t)/(a-b) - a.*exp(-b*t)/(a-b)).*ut;
plot(t,Y );
hold on
end

hold off
grid
xlabel('t[s]')
ylabel('y(t)')
legend ('a=0.1, b=0.2', ...
    'a=1 , b=2', ...
    'a=10, b=12')