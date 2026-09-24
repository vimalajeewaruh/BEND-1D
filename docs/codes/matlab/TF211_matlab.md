# TF211 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
u=max(x-0.035,0); gate=S(x,0.035,0.0025);
f=gate.*(0.62*exp(-2.2*u).*sin(2*pi*7*u) ...
 +0.34*exp(-4.0*u).*sin(2*pi*14.25*u+0.15) ...
 +0.22*exp(-6.0*u).*sin(2*pi*21.7*u+0.4) ...
 +0.14*exp(-8.0*u).*sin(2*pi*29.5*u+0.7));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF211 — PianoInharmonicDecay')
~~~
