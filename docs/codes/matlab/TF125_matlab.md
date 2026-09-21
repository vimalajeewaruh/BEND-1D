# TF125 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
g1=0.85*exp(-0.5*((x-0.48)/0.19).^2);
g2=0.82*exp(-0.5*((x-0.50)/0.20).^2);
residual=0.08*sin(2*pi*7*x)+0.04*exp(-0.5*((x-0.62)/0.010).^2);
f=g1-g2+residual;
plot(x,f); grid on; title('TF125 — CancellationTrap')
exportgraphics(gcf,'TF125_CancellationTrap.png','Resolution',300);
~~~
