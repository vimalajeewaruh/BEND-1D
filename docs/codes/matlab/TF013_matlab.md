~~~matlab
N = 1024;
x = linspace(0,1,N);
depolarization = 1.20./(1+exp(-180*(x-0.23)));
repolarization = 1.05./(1+exp(-55*(x-0.53)));
undershoot = 0.22*exp(-((x-0.67)/0.065).^2);
f = depolarization-repolarization-undershoot;

plot(x,f,'LineWidth',1.5)
xlabel('x'); ylabel('f(x)');
title('TF013 — ActionPotential'); grid on
exportgraphics(gcf,'TF013_ActionPotential.png','Resolution',300);
~~~
