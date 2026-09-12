# TF020 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.68;
Aq = 0.20;       % implementation convention
wq = 0.035;      % implementation convention

fc = -log(1-xc/(xc+0.035)) + 0.12*sin(20*pi*xc);

u = x-xc;
continuity = Aq*exp(-((xc-0.80)/wq)^2).*exp(-11*u);
fpost = fc*exp(-11*u) - Aq*exp(-((x-0.80)/wq).^2) + continuity;
f = zeros(size(x));
pre = (x<xc);
bpre = -log(1-x(pre)/(xc+0.035));
f(pre) = bpre + 0.12*(x(pre)/xc).^3.*sin(20*pi*x(pre));
f(~pre) = fpost(~pre);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF020 — ThermalRunaway'); grid on
exportgraphics(gcf,'TF020_ThermalRunaway.png','Resolution',300);
~~~
