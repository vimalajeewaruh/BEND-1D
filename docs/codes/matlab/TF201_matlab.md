# TF201 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.20+0.03*sin(2*pi*x);
c=[0.16 0.36 0.54 0.69]; a=[0.48 0.62 0.45 0.70]; tau=[0.075 0.095 0.080 0.110];
for k=1:4
 u=max(x-c(k),0); resp=(x>=c(k)).*(u/tau(k)).*exp(1-u/tau(k));
 f=f+a(k)*resp;
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF201 — CGMMealStack')
~~~
