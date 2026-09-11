~~~matlab
N = 1024;
x = linspace(0,1,N);
Delta = 0.035;
f = sqrt(4*(x-0.52).^2 + Delta^2);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF010 — AvoidedCrossing'); grid on
exportgraphics(gcf,'TF010_AvoidedCrossing.png','Resolution',300);
~~~
