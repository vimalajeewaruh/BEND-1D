# TF206 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=0.08+0.28*(1-exp(-(x/0.012).^1.25)) ...
 +0.25*(1-exp(-(x/0.075).^1.15)) ...
 +0.38*(1-exp(-(x/0.32).^1.55));
f=f+0.035*G(x,0.085,0.018)-0.025*G(x,0.20,0.032);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF206 — OJIPFluorescence')
~~~
