%exercicio 24
h=1e-6;
t=-1e-3:h:5e-3;
R=1e3;
C=1e-6;

ut = t>0;

Vo=5*exp(-1/(R*C)*t).*ut;

plot(t, Vo);
grid on
xlabel('t[s]')
ylabel('Vo(t)')
axis tight