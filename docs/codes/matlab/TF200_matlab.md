# TF200 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
thermal=0.12+0.78*(1-exp(-4*x)); gate=S(x,0.44,0.01);
sq=0.5*(1+sign(sin(2*pi*12*(x-0.44))));
f=thermal-0.16*gate.*sq+0.045*gate.*sin(2*pi*24*(x-0.44));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF200 — ThermalThrottle')
~~~
