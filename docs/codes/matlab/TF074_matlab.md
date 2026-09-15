# TF074 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
phase=2*pi*(12*x+24*x.^2+0.50*sin(2*pi*3*x));
env=0.32+0.68*exp(-0.5*((x-0.58)/0.30).^2);
side=0.16*sin(2*pi*(62*x+3*sin(2*pi*2*x)));
f=env.*sin(phase)+side;
plot(x,f); grid on; title('TF074 — RadarMicroDoppler')
exportgraphics(gcf,'TF074_RadarMicroDoppler.png','Resolution',300);
~~~
