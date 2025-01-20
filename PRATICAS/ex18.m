%exercicio 18

fa=14;%Frequencia de amostra, tem de ser par
Np=10;%Nr de periodos
f0=2 %frequencia fundamental do sinal
h=1/fa;
t=0:h:Np/f0-h;%Np/f0-h
x=sin(4*pi*t)+cos(12*pi*t)


[X,f]=DFT(x,h)% chamar a funcao DfT
stem(f, abs(X))%grafico de amostragem magnitude
[y, tau]=IDFT(X,f);
plot(t,x,'r*','b+');