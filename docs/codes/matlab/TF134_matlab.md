# TF134 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
u=max(x-0.50,0);
f=0.25+0.08*sin(2*pi*6*x)+0.03*sin(2*pi*18*x) ...
 +0.48*exp(-0.5*((x-0.49)/0.035).^2) ...
 +(x>=0.50).*0.20.*exp(-9*u).*sin(2*pi*15*u)+0.12*S(x,0.56,0.020);
plot(x,f); grid on; title('TF134 — WindTurbineGustControl')
exportgraphics(gcf,'TF134_WindTurbineGustControl.png','Resolution',300);
~~~
