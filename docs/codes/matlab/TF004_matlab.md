~~~matlab
N = 1024;
x = linspace(0,1,N);
x0 = 0.28;
f = zeros(size(x));
idx = x >= x0;
u = x(idx)-x0;
f(idx) = exp(-7*u).*sin(32*pi*u);

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('f(x)');
title('TF004 — RingDown'); grid on
exportgraphics(gcf,'TF004_RingDown.png','Resolution',300);
~~~
