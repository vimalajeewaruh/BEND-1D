# TF114 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.12*sin(2*pi*5*x)+0.035*sin(2*pi*17*x+0.4)+0.42*S(x,0.57,0.003);
u=max(x-0.57,0); f=f-(x>=0.57).*0.25.*(1-exp(-5*u));
plot(x,f); grid on; title('TF114 — GNSSMultipathSlip')
exportgraphics(gcf,'TF114_GNSSMultipathSlip.png','Resolution',300);
~~~
