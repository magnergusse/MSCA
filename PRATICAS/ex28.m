%% exercicio 28
R=10;
L=1e-3;
C=10e-6;


% definicao da funçao transferencia
s = tf ([1 0], 1)
Gs = (s/(R*C))/(s^2 +s/(R*C)+1/(L*C))

%% 28.c
step (2*Gs)

%% 28.d

u=@(t) t>=0;%definiçao do degrau unitario
mu=@(t) u(t)+u(t-0.5e-3)-2*u(t-1e-3);%definicao da soma e subtracao do vetor unitario ou seja os steps
lsim(Gs, mu(t) ,t)%simulacao com base na funcao transferencia e o sinal
%% 28.e
h=1e-6

f=[100 1e3 1.6e3 3e3 16e3]
M = zeros (numel(f),1)
for I=1:numel(f)
t=0:h:10/(f(I)-h)
mu2=@(t) sin(2*pi*f*t);% definicaao da sinusoide de entrada
Y=lsim(Gs, mu2(t) ,t)%simulacao com base na funcao transferencia e o sinal sinusoidal
M(I)=max(Y(t>=9/f(I)));
%susbplot (numel(f), 1, I)
%plot(t,y,t, mu2(t))
end

semilogx(f, 20*log10(M), '*-')
grid
xlabel('f(HZ)');
ylabel('|G(j2\pi f|_dB');