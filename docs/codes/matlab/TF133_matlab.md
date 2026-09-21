# TF133 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.06+0.018*sin(2*pi*4*x);
c=[0.20 0.52 0.77]; a=[0.22 0.30 0.18]; w=[0.070 0.085 0.060];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
d=[0.18 0.235 0.49 0.54 0.705 0.79]; b=[0.16 0.12 0.20 0.10 0.08 0.15];
for k=1:numel(d), f=f+b(k)*exp(-0.5*((x-d(k))/0.007).^2); end
plot(x,f); grid on; title('TF133 — ATACChromatinAccessibility')
exportgraphics(gcf,'TF133_ATACChromatinAccessibility.png','Resolution',300);
~~~
