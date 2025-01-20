A=1;%ampliotude da noca funcao
phi= rand(3,1)*2*pi-pi; %3 nrs aleatorios *2*pi - pi, vector 3x1
f=3e3./[1;1.1;1.2]; %frequencia 3 *10 elevado a 3
x=@(t) A*sin(2*pi*f(1)*t+phi(1))+...
    A*sin(2*pi*f(2)*t+phi(2))+...
    A*sin(2*pi*f(3)*t+phi(3))
    %@funcao anonima, sem precisar criar um novo ficheiro
N=100; % nr de pontos em que vai ser feito o calculo
f0=3e4/660;
t=linspace (0,2/f0, N);
plot(t, x(t))
grid on
xlabel('Tempo[s]')
ylabel('x(t)')
P=integral(@(t) x(t).^2, 0,1/f0)*f0
%a criar  uma funcao para ser integrada
%a nova funcao é x(t) ao quadrado, entre 0 e o periodo, multiplicado pela freq