N=1e3
h=1e-3

for I=1:3
    [x,t] = GeraSinal(N,h);
    %plot (t,x)
    [X,f ] = DFT(x,h)
    stem(f, abs(X))
    hold on

end

hold off

%%

figure
filter_sq = abs(f) < 2;
[x_sem_r, t2] = IDFT(X.*filter_sq, f);
[r, t3] = IDFT(X.*(~filter_sq),f);
plot (t2, x_sem_r, t, x, t3, r)
legend('Sinal filtrado', 'sinal original', 'sinal ruido')