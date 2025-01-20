%Exercicio 14 a,b,c,d)

h=0.01%periodo de amostragem
Np=10%nr de periodos de amostra
f0=1%frequencia fundamental em HZ
t=0:h:5%tempo de amostragem para os graficos ou passo do grafico
% vai de 0 a 5 segundos
%y=sin(10*pi*t)+cos(12*pi*t)+cos((14*pi*t)+(pi/4))%funcao
%x=sin(2*pi*t)
z=(square(2*pi*t)+1)/2% square faz sair a funçao quadrada
%q=sawtooth(2*pi*t+pi/2, 1/2)% sawtooth pra sair triangular

[X,f]=DFT(z,h)% chamar a funcao que vai fazer o dft
%subplot(2,1,1)
stem(f, abs(z))%grafico de amostragem magnitude
%stem(f,real(X))% grafico de amostragem nrs reais
%subplot(2,1,2)
%stem(f, imag(X))%grafico de amostragem imaginarios
hold on
plot (t ,z)


