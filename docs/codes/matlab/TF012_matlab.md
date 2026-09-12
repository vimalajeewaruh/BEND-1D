# TF012 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
rise = 1./(1+exp(-100*(x-0.25)));
depletion = 1./(1+exp(-40*(x-0.55)));
relaxation = zeros(size(x));
idx = x >= 0.55;
u = x(idx)-0.55;
relaxation(idx) = 0.20*exp(-9*u).*sin(45*pi*u);
f = rise-depletion+relaxation;

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('f(x)');
title('TF012 — BZPulse'); grid on
exportgraphics(gcf,'TF012_BZPulse.png','Resolution',300);
~~~
