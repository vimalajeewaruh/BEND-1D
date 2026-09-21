# TF115 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.78+0.08*x;
c=[0.22 0.46 0.59 0.625 0.81]; a=[0.12 0.25 0.18 0.14 0.08];
w=[0.030 0.040 0.018 0.016 0.024];
for k=1:numel(c), f=f-a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
plot(x,f); grid on; title('TF115 — HyperspectralMineral')
exportgraphics(gcf,'TF115_HyperspectralMineral.png','Resolution',300);
~~~
