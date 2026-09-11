
~~~matlab
N = 1024;
T = readtable('Platinum5Y_monthly.csv');
P = T.Price(:);
assert(numel(P)==60, 'Expected exactly 60 monthly prices.');

Ps = P;
Ps(2:end-1) = (P(1:end-2)+6*P(2:end-1)+P(3:end))/8;

xm = linspace(0,1,60);
x = linspace(0,1,N);
f0 = pchip(xm,Ps,x);

fstd = (f0-mean(f0))/sqrt(mean((f0-mean(f0)).^2));

plot(x,f0,'LineWidth',1.6); hold on
plot(xm,P,'o','MarkerSize',3)
xlabel('x'); ylabel('US dollars per troy ounce');
title('TF025 — Platinum5Y'); grid on
legend('Lightly smoothed PCHIP','Monthly observations','Location','best')
exportgraphics(gcf,'TF025_Platinum5Y.png','Resolution',300);
~~~
