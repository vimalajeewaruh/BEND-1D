~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.48;
u = x-xc;

s = 4*atan(exp(12*u))-pi;
f = s + 0.18*exp(-2.2*x).*sin(8*pi*x) ...
      + 0.10*(x>=xc).*exp(-8*u).*sin(36*pi*u);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF017 — Klatno'); grid on
exportgraphics(gcf,'TF017_Klatno.png','Resolution',300);
~~~
