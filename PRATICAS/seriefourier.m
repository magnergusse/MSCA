function out = seriefourier(h, f0, Np, ak, bk)

% h= periodo de amostragem
%f0= frequencia 
%Np= Nr de periodos
%ak= Vetor [K+1]x1
%bk= vetor Kx1

t=0:h:Np/f0-h;
x= ones(1, numel(t))*ak(1);
for I = 1:1:numel(bk)
    x = x+ ak(I+1)*cos(2*I*pi*t*f0) + bk(I)*sin (2*I*pi*t*f0);
end

plot (t,x)