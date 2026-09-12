# TF002 — MATLAB Implementation
~~~matlab
N = 1024;
x = linspace(0,1,N);
lambda = 0.08 + 0.92*x;
f = lambda.^(-5) ./ expm1(2.5 ./ lambda);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF002 — Planck'); grid on
exportgraphics(gcf,'TF002_Planck.png','Resolution',300);
~~~
