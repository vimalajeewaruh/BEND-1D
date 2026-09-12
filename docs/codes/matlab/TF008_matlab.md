# TF008 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
x0 = 0.27;
u = x-x0;
impact = 1.20*exp(-0.5*((x-x0)/0.006).^2);
mode1 = zeros(size(x));
mode2 = zeros(size(x));
idx = x >= x0;
mode1(idx) = exp(-8*u(idx)).*sin(34*pi*u(idx));
mode2(idx) = 0.28*exp(-11*u(idx)).*sin(82*pi*u(idx));
f = impact + mode1 + mode2;

plot(x,f,'LineWidth',1.3)
xlabel('x'); ylabel('f(x)');
title('TF008 — ImpactSpring'); grid on
exportgraphics(gcf,'TF008_ImpactSpring.png','Resolution',300);
~~~
