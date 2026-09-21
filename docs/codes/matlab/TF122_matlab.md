# TF122 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.02*ones(size(x));
c=[0.08 0.15 0.24 0.31 0.405 0.47 0.505 0.59 0.69 0.77 0.86 0.93];
a=[0.22 -0.18 0.30 0.50 -0.25 0.70 0.42 -0.35 0.55 0.24 -0.20 0.38];
w=[0.030 0.015 0.020 0.010 0.012 0.008 0.006 0.016 0.004 0.010 0.006 0.003];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
plot(x,f); grid on; title('TF122 — PeakForest')
exportgraphics(gcf,'TF122_PeakForest.png','Resolution',300);
~~~
