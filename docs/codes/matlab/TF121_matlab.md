# TF121 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
cusp=0.45*sqrt(abs(x-0.30));
chirp=0.22*sin(2*pi*(8*x+18*x.^2));
step=0.28*S(x,0.68,0.004); trend=0.10*x;
f=cusp+chirp+step+trend;
plot(x,f); grid on; title('TF121 — CuspChirpStep')
exportgraphics(gcf,'TF121_CuspChirpStep.png','Resolution',300);
~~~
