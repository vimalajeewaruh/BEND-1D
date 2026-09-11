~~~matlab
N = 1024;
x = linspace(0,1,N);

f = 0.08*log(1+20*x) ...
    + 0.55*tanh((x-0.31)/0.018) ...
    + 0.32*tanh((x-0.69)/0.060) ...
    + 0.13*tanh((x-0.84)/0.014) ...
    + 0.07*exp(-((x-0.50)/0.028).^2);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF022 — Titration'); grid on
exportgraphics(gcf,'TF022_Titration.png','Resolution',300);
~~~
