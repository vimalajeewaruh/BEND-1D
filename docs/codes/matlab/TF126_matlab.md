# TF126 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
background=0.035*sin(2*pi*3*x)+0.015*x;
packet=0.28*exp(-0.5*((x-0.46)/0.075).^2).*sin(2*pi*(18*x+14*x.^2));
echo=0.10*exp(-0.5*((x-0.64)/0.025).^2).*sin(2*pi*45*x);
f=background+(1-0.25*x).*packet+echo;
plot(x,f); grid on; title('TF126 — DASFiberEvent')
exportgraphics(gcf,'TF126_DASFiberEvent.png','Resolution',300);
~~~
