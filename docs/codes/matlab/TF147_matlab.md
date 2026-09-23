# TF147 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
phiUp=2*pi*(8*x+20*x.^2); phiDown=2*pi*(28*x-20*x.^2);
amplitude=0.75+0.25*exp(-0.5*((x-0.50)/0.30).^2);
f=amplitude.*(0.25*sin(phiUp)+0.25*sin(phiDown+0.35));
plot(x,f); grid on; title('TF147 — FrequencyCrossing')
exportgraphics(gcf,'TF147_FrequencyCrossing.png','Resolution',300);
~~~
