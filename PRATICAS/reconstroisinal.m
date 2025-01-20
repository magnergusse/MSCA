%Exercicio 11

function [xt,t]=reconstroisinal(x,h);
fs=1/h;
N=numel(x)
t=(0:h/100:5)';
xt=zeros(numel(t),1);

for n=1:N
    xt= xt + x(n)*sin(pi*fs*(t-(n-1)*h))./(pi*fs*(t-(n-1)*h))%n-1 pq o index do matlab começa em 1 e a nossa funçao começa em 0
    %xt= xt + x(n)*sinc(fs*(t-(n-1)*h))
end


%sinc(fs)=(sin(pi*fs*t))/(pi*fs*t)

end