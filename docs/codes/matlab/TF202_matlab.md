# TF202 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
kcomp=-0.75*G(x,0.43,0.035)+0.48*G(x,0.475,0.048);
spindle=0.32*G(x,0.66,0.075).*sin(2*pi*37*(x-0.66));
slow=0.06*sin(2*pi*2.4*x); f=slow+kcomp+spindle;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF202 — SleepSpindleKComplex')
~~~
