~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.30;
u = x-xc;

f = 0.65*(1+tanh(120*u)) ...
    + 0.38*(x>=xc).*exp(-6*u).*cos(54*pi*u);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF019 — WaterHammer'); grid on
exportgraphics(gcf,'TF019_WaterHammer.png','Resolution',300);
~~~
