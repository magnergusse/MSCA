t=0:0.001:2;
T
q= A*sin(((2*pi*t)/T) + fi)
%function out = Potencia(t, x, T)
out = trapz(t,x.^2, T)
