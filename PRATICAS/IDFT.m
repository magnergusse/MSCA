% idft 
%exercicio 17

function [X,t]=IDFT(x,f)

fa=max(abs(f))*2;
h=1/fa;
N=numel(f)
t=(0:N-1)*h
X= ifft(ifftshift(N*x))


end

%X=ifftshift(ifft(x))/numel(x);%iffshift para mostrar os dois lados de forma inversa??
%h=1/fa;
%t=(0:numel(x)-1)*2*pi/numel(x)*h/(2*pi)-h/2;
%ver pq n funciona