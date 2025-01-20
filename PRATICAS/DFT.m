%DFT funbctions
function [X,f]=DFT(x,h)
X=fftshift(fft(x))/numel(x);%ffshift para mostrar os dois lados
fa=1/h
f=(0:numel(x)-1)*2*pi/numel(x)*fa/(2*pi)-fa/2;
end