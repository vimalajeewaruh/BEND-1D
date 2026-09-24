# TF225 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.18+0.10*x; c=[0.43 0.76]; a=[0.72 -0.32]; t1=[0.055 0.040]; t2=[0.24 0.14];
for k=1:2
 u=max(x-c(k),0); f=f+(x>=c(k)).*a(k).*(0.72*exp(-u/t1(k))+0.28*exp(-u/t2(k)));
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF225 — YieldShockRecovery')
~~~
