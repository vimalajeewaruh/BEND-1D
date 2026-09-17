# TF099 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
base=0.10+0.018*sin(2*pi*4*x);
on=0.62*exp(-0.5*((x-0.30)/0.012).^2);
sustained=0.30*(s(x,0.31,0.010)-s(x,0.69,0.018));
adapt=-0.12*(1-exp(-6*max(x-0.33,0))).*(x>=0.33 & x<0.69);
secondary=0.16*exp(-0.5*((x-0.52)/0.025).^2);
off=-0.18*exp(-0.5*((x-0.71)/0.016).^2)+0.10*exp(-0.5*((x-0.755)/0.025).^2);
f=base+on+sustained+adapt+secondary+off;
plot(x,f); grid on; title('TF099 — CavefishNeuromast')
exportgraphics(gcf,'TF099_CavefishNeuromast.png','Resolution',300);
~~~
