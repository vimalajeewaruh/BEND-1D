# TF140 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.18+0.16*x+0.05*sin(2*pi*1.5*x);
for c=[0.18 0.34 0.52 0.76], f=f+0.16*exp(-0.5*((x-c)/0.025).^2); end
u=max(x-0.62,0);
f=f+0.10*S(x,0.62,0.004)+(x>=0.62).*0.10.*exp(-12*u).*sin(2*pi*28*u);
plot(x,f); grid on; title('TF140 — BridgeStrainEvent')
exportgraphics(gcf,'TF140_BridgeStrainEvent.png','Resolution',300);
~~~
