# TF139 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=zeros(size(x));
c=[0.15 0.34 0.50 0.525 0.72 0.88]; a=[0.60 0.42 0.50 0.40 0.28 0.11];
w=[0.012 0.014 0.010 0.010 0.016 0.012];
for k=1:numel(c)
    z=(x-c(k))/w(k); f=f+a(k)*z.*exp(-0.5*z.^2);
end
u=max(x-0.72,0); f=f+(x>=0.72).*0.07.*exp(-9*u).*sin(2*pi*35*u);
plot(x,f); grid on; title('TF139 — TerahertzLayerEcho')
exportgraphics(gcf,'TF139_TerahertzLayerEcho.png','Resolution',300);
~~~
