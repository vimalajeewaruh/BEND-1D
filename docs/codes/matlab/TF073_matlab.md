# TF073 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.018+0.012*x;
c=[0.16 0.34 0.515 0.542 0.73 0.88]; A=[0.30 0.62 1.00 0.72 0.44 0.21];
w=[0.010 0.014 0.009 0.008 0.017 0.006];
for k=1:numel(c), f=f+A(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
f=f+0.045*exp(-0.5*((x-0.64)/0.09).^2);
plot(x,f); grid on; title('TF073 — LidarMultiEcho')
exportgraphics(gcf,'TF073_LidarMultiEcho.png','Resolution',300);
~~~
