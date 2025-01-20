%exercicio 26
h=1e-3
t=-1:h:7;
ut1=@(t) t>=0;

y1 =@(t) (1/4 - (1/4)*exp(-2*t) -(1/2)* t.*exp(-2*t)).*ut1(t);
Y=@(t) y1(t)-y1(t-2);
mu=@(t) ut1(t)-ut1(t-2)

plot(t,mu(t),t, Y(t) );
grid on
xlabel('t[s]')
ylabel('y(t)')
 %% ex 27

 Gs = tf(1, [1 4 4]);%funçao transferencia num=1; den=s^2 +4s+4
 % step GS, funcao transferencia
 lsim(Gs, mu(t),t)