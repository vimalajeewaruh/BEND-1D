# TF118 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.20+0.55*S(x,0.28,0.060);
f=f-0.22*S(x,0.64,0.008)+0.06*sin(2*pi*8*x).*S(x,0.64,0.010);
plot(x,f); grid on; title('TF118 — GPUThermalThrottle')
exportgraphics(gcf,'TF118_GPUThermalThrottle.png','Resolution',300);
~~~
