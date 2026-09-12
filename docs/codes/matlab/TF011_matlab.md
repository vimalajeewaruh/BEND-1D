# TF011 — MATLAB Implementation
~~~matlab
N = 1024;
x = linspace(0,1,N);
r = 0.35 + 2*x;
De = 1;
aMorse = 2.8;
re = 0.80;
f = De*(1-exp(-aMorse*(r-re))).^2-De;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF011 — Morse'); grid on
exportgraphics(gcf,'TF011_Morse.png','Resolution',300);
~~~
