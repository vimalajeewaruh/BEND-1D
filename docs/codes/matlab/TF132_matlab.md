# TF132 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.55*exp(-3.5*x).*cos(2*pi*18*x) ...
 +0.34*exp(-7*x).*cos(2*pi*31*x+0.3) ...
 +0.18*exp(-1.2*x).*cos(2*pi*8*x-0.5) ...
 +0.06*exp(-0.55*x).*cos(2*pi*43*x+0.8);
plot(x,f); grid on; title('TF132 — MRFreeInductionDecay')
exportgraphics(gcf,'TF132_MRFreeInductionDecay.png','Resolution',300);
~~~
