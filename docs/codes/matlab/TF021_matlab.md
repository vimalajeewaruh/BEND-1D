# TF021 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);

z = 18*pi*(x-0.50);
A = ones(size(x));
idx = (z~=0);
A(idx) = (sin(z(idx))./z(idx)).^2;

M = 0.18 + 0.82*cos(15*pi*(x-0.50)).^2;

z2 = 34*pi*(x-0.67);
S = 0.10*ones(size(x));
idx2 = (z2~=0);
S(idx2) = 0.10*(sin(z2(idx2))./z2(idx2)).^2;

f = A.*M + S;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF021 — Diffraction'); grid on
exportgraphics(gcf,'TF021_Diffraction.png','Resolution',300);
~~~
