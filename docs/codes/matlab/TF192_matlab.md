# TF192 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.82+0.03*sin(2*pi*2*x);
c=[0.20 0.50 0.76]; a=[0.36 0.48 0.32];
tf=[0.010 0.012 0.008]; ts=[0.095 0.135 0.080];
for k=1:3
 u=max(x-c(k),0);
 f=f-(x>=c(k)).*a(k).*(1-exp(-u/tf(k))).*exp(-u/ts(k));
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF192 — FuelCellFloodDry')
~~~
