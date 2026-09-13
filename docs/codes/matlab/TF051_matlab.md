# TF051 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
sea = (0.48+0.15*sin(2*pi*0.8*x)).*(sin(2*pi*9*x)+0.20*sin(2*pi*18*x+0.5));
rogue = 1.55*exp(-0.5*((x-0.61)/0.030).^2).*sin(2*pi*9*(x-0.61)+pi/2);
f = sea+rogue;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF051 — RogueWave')
exportgraphics(gcf,'TF051_RogueWave.png','Resolution',300);
~~~
