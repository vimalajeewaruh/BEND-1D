# TF015 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = -sqrt(x.*(1-x)).*log(sqrt((x-0.57).^2+0.006^2));

plot(x,f,'LineWidth',1.5)
xlabel('x'); ylabel('f(x)');
title('TF015 — VanHove'); grid on
exportgraphics(gcf,'TF015_VanHove.png','Resolution',300);
~~~
