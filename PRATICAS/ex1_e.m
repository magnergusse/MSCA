t=0:0.001:2;

q= sin(4*pi*t) + sin(8*pi*t)+ sin(14*pi*t);
plot (t,q)
grid on
xlabel('Tempo[s]')
ylabel('q(t)')
