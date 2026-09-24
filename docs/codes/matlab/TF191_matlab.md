# TF191 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
kappa=26; x0=0.64;
sp=log1p(exp(kappa*(x-x0)))/kappa;
sp1=log1p(exp(kappa*(1-x0)))/kappa;
f=1-0.18*x-0.58*(sp/sp1).^1.55;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF191 — BatteryKnee')
~~~
