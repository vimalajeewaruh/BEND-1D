# TF205 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=ones(size(x)); c=[0.34 0.67]; a=[0.54 0.34]; tf=[0.012 0.018]; ts=[0.19 0.14];
for k=1:2
 u=max(x-c(k),0);
 f=f-(x>=c(k)).*a(k).*(1-exp(-u/tf(k))).*exp(-u/ts(k));
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF205 — DesaturationRecovery')
~~~
