# TF001 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
pc = 0.38;
beta = 0.41;
f = max(x-pc,0).^beta;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF001 — Percolation'); grid on
exportgraphics(gcf,'TF001_Percolation.png','Resolution',300);
~~~
