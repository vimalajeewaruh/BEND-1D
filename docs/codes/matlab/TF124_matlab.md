# TF124 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
p1=0.30*exp(-0.5*((x-0.50)/0.22).^2).*sin(2*pi*8*x);
p2=0.24*exp(-0.5*((x-0.56)/0.080).^2).*sin(2*pi*28*x);
p3=0.17*exp(-0.5*((x-0.59)/0.022).^2).*sin(2*pi*85*x);
f=p1+p2+p3;
plot(x,f); grid on; title('TF124 — NestedWavePackets')
exportgraphics(gcf,'TF124_NestedWavePackets.png','Resolution',300);
~~~
