%Exercicio13

h=0.01%periodo de amostragem
Np=1%nr de periodos de amostra
f0=1%frequencia fundamental em HZ
t=0:h:Np/f0-h%tempo de amostragem para os graficos ou passo do grafico
% vai de 0 a Np/f0-h ou seja T maiusculo - h
x=sin(2*pi*t)%funcao
[X,f]=DFT(x,h)% chamar a funcao
subplot(2,1,1)
stem(f, abs(X))%grafico de amostragem magnitude
stem(f,real(X))% grafico de amostragem nrs reais
subplot(2,1,2)
stem(f, imag(X))%grafico de amostragem imaginarios
%hold on
%plot (f ,x)