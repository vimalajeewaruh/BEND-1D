# TF212 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
u=max(x-0.045,0); gate=S(x,0.045,0.002);
f=gate.*(0.72*exp(-1.8*u).*sin(2*pi*6.5*u) ...
 +0.32*exp(-5.5*u).*sin(2*pi*13*u+0.2) ...
 +0.22*exp(-8.0*u).*sin(2*pi*19.5*u+0.5) ...
 +0.12*exp(-11*u).*sin(2*pi*32.5*u));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF212 — GuitarPluckDualDecay')
~~~
