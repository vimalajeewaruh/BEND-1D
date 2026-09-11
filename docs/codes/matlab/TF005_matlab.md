~~~matlab
N = 1024;
x = linspace(0,1,N);
f = 0.5*(erf((x-0.28)/0.025) - erf((x-0.72)/0.070));

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF005 — DiffusionBand'); grid on
exportgraphics(gcf,'TF005_DiffusionBand.png','Resolution',300);
~~~
