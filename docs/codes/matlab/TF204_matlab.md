# TF204 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=zeros(size(x)); c=[0.28 0.405 0.53]; a=[1.0 0.48 0.32];
tau=[0.035 0.027 0.045]; p=[1.2 1.4 1.1];
for k=1:3
 u=max(x-c(k),0); resp=(x>=c(k)).*(u/tau(k)).^p(k).*exp(p(k)-u/tau(k));
 f=f+a(k)*resp;
end
f=f.*(1+0.08*sin(2*pi*23*x));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF204 — CoughFlowBurst')
~~~
