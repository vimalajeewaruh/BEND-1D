# TF075 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.35+0.28*x-0.10*x.^2+(0.025+0.035*x).*sin(2*pi*(8*x+3*x.^2));
f=f+0.52*exp(-0.5*((x-0.61)/0.010).^2)-0.20*exp(-0.5*((x-0.635)/0.016).^2);
f=f+0.12*(s(x,0.72,0.012)-s(x,0.86,0.018));
plot(x,f); grid on; title('TF075 — MeltPoolInstability')
exportgraphics(gcf,'TF075_MeltPoolInstability.png','Resolution',300);
~~~
