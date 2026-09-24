# TF208 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.12*ones(size(x)); c=[0.08 0.57]; a=[0.78 0.70]; tr=[0.040 0.050]; td=[0.17 0.19];
for k=1:2
 u=max(x-c(k),0); f=f+(x>=c(k)).*a(k).*(1-exp(-u/tr(k))).*exp(-u/td(k));
end
f=f+0.03*sin(2*pi*2*x-0.4);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF208 — SapFlowLag')
~~~
