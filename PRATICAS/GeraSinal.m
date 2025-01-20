%Exercicio 19 funçao

function [x,t]=GeraSinal(N,h);
t=(0:N-1)*h;
lambda1=randn(1,N)*pi;
phi1= cumtrapz(t,lambda1)
lambda2=randn(1,N)*pi;
phi2= cumtrapz(t,lambda2)
r= 0.5*sin((20*pi*t) +(10* phi1)) + 0.5*sin((24*pi*t) +(10* phi2))

x=sin(2*pi*t)+r;


end