~~~matlab
N = 1024;
x = linspace(0,1,N);

f = exp(-0.9*x).*sin(2*pi*(3*x+7*x.^2)).^2;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF023 — RabiChirp'); grid on
exportgraphics(gcf,'TF023_RabiChirp.png','Resolution',300);
~~~
