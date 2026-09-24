# TF188 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
q=6.4*x+0.07*sin(2*pi*x); ramp=q-floor(q);
f=0.12+0.78*ramp.*(1+0.10*sin(2*pi*1.1*x));
c=[0.156 0.312 0.468 0.625 0.782 0.937];
a=[0.12 0.08 0.15 0.10 0.16 0.08];
for k=1:numel(c), f=f+a(k)*G(x,c(k),0.006); end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF188 — TokamakELMTrain')
~~~
