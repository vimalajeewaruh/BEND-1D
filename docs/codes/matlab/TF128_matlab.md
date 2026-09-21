# TF128 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.10+0.03*x;
c=[0.14 0.23 0.36 0.49 0.62 0.73 0.81];
a=[0.16 0.28 0.42 0.26 0.54 0.31 0.18];
w=[0.008 0.010 0.012 0.009 0.010 0.007 0.006];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
f=f+0.07*exp(-0.5*((x-0.655)/0.004).^2);
plot(x,f); grid on; title('TF128 — OCTRetinalProfile')
exportgraphics(gcf,'TF128_OCTRetinalProfile.png','Resolution',300);
~~~
