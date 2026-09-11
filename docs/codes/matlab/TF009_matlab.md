~~~matlab
N = 1024;
x = linspace(0,1,N);
V0 = 1;
a = 7;
E = 0.15 + 1.70*x;
T = zeros(size(E));

below = E < V0-1e-12;
above = E > V0+1e-12;
atBarrier = ~(below | above);

z = V0-E(below);
T(below) = 1 ./ (1 + V0^2*sinh(a*sqrt(z)).^2 ./ (4*E(below).*z));

z = E(above)-V0;
T(above) = 1 ./ (1 + V0^2*sin(a*sqrt(z)).^2 ./ (4*E(above).*z));

T(atBarrier) = 1/(1+V0*a^2/4);
f = T;

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('T(E(x))');
title('TF009 — QuantumBarrier'); grid on
exportgraphics(gcf,'TF009_QuantumBarrier.png','Resolution',300);
~~~
