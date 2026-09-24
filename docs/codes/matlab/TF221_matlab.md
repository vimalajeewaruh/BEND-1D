# TF221 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
amp=0.45+0.20*sin(2*pi*0.75*x+0.4); phase=2*pi*(2.1*x+0.22*x.^2);
f=amp.*sin(phase)+0.22*G(x,0.28,0.06)-0.18*G(x,0.57,0.07)+0.25*G(x,0.83,0.045);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF221 — ENSOEnvelope')
~~~
