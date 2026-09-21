# TF138 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.03*ones(size(x));
c=[0.10 0.20 0.30 0.405 0.435 0.58 0.70 0.82 0.92];
a=[0.45 0.50 0.47 0.44 0.39 0.76 0.12 0.49 0.46];
w=[0.015 0.014 0.016 0.013 0.013 0.030 0.012 0.015 0.014];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
plot(x,f); grid on; title('TF138 — MicrofluidicDropletTrain')
exportgraphics(gcf,'TF138_MicrofluidicDropletTrain.png','Resolution',300);
~~~
