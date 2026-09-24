# TF215 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.72+0.05*sin(2*pi*0.8*x);
c=[0.18 0.38 0.59 0.78]; a=[0.48 0.38 0.55 0.44]; tf=[0.015 0.020 0.012 0.018]; ts=[0.08 0.11 0.09 0.10];
for k=1:4
 u=max(x-c(k),0); f=f-(x>=c(k)).*a(k).*(1-exp(-u/tf(k))).*exp(-u/ts(k));
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF215 — TrafficStopGo')
~~~
