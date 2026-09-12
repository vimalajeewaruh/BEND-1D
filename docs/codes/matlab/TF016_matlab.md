# TF016 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.72;
f = zeros(size(x));

before = x < xc;
z = xc-x(before);
f(before) = 1.50-0.80*z.^0.42.*(1+0.12*cos(9*log(z)));

after = x >= xc;
f(after) = 0.92+0.42*(1-exp(-8*(x(after)-xc)));

plot(x,f,'LineWidth',1.3)
xline(xc,'--r','Crash time')
xlabel('x'); ylabel('f(x)');
title('TF016 — MarketCrash'); grid on
exportgraphics(gcf,'TF016_MarketCrash.png','Resolution',300);
~~~
