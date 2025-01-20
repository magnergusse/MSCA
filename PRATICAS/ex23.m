h=1e-3
t=0:h:10;
ut=t>=0;

Y = (2-2*exp(-t) - t.*exp(-t)).*ut;
plot(t,Y );
grid on
xlabel('t[s]')
ylabel('y(t)')
