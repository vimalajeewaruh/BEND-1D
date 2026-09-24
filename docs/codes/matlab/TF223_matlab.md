# TF223 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=0.16+2.2*(x-0.5).^2+0.025*sin(2*pi*45*x).*(1+2.5*abs(x-0.5));
c=[0.08 0.32 0.71 0.93]; a=[0.18 0.10 0.12 0.20]; w=[0.008 0.006 0.007 0.006];
for k=1:4, f=f+a(k)*G(x,c(k),w(k)); end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF223 — IntradayVolatilityU')
~~~
