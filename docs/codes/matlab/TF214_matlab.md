# TF214 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
u=max(x-0.06,0); gate=S(x,0.06,0.002);
f=gate.*(0.58*exp(-4*u).*sin(2*pi*8.5*u) ...
 +0.40*exp(-5.8*u).*sin(2*pi*13.7*u+0.7) ...
 +0.27*exp(-7.5*u).*sin(2*pi*22.4*u+0.3) ...
 +0.16*exp(-10*u).*sin(2*pi*31.2*u+1.0));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF214 — DrumModePacket')
~~~
