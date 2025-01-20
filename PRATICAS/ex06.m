%Exercicio 7
h=1e-3;
f0=1;
Np=2;
K=11;
ak=zeros(1,K+1);
k=(1:K);
bk=2*(1-cos(k*pi))./(k*pi);

seriefourier(h, f0, Np, ak, bk);
hold on
t=0:h:Np/f0-h;
plot(t,y)
hold off
