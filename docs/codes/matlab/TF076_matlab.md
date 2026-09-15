# TF076 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=1.02*exp(-1.25*x);
c=[0.17 0.43 0.69 0.865]; a=[0.08 0.14 0.24 0.11];
w=[0.0035 0.0045 0.0030 0.0040];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
f=f-0.18*s(x,0.705,0.0025)+0.010*sin(2*pi*4*x);
plot(x,f); grid on; title('TF076 — FiberOTDR')
exportgraphics(gcf,'TF076_FiberOTDR.png','Resolution',300);
~~~
