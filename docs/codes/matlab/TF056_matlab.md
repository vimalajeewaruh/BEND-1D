# TF056 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
season = 0.30+0.10*sin(2*pi*4*x-0.8);
outbreak = 0.95*exp(-0.5*((x-0.54)/0.060).^2);
intervention = -0.18./(1+exp(-70*(x-0.63)));
f = season+outbreak+intervention;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF056 — EpidemicSeasonal')
exportgraphics(gcf,'TF056_EpidemicSeasonal.png','Resolution',300);
~~~
