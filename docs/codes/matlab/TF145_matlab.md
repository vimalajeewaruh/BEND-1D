# TF145 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.10*x+0.28*S(x,0.18,0.0025)+0.35*abs(x-0.36) ...
 +0.18*(x-0.55).^2.*(x>=0.55)+0.25*sqrt(abs(x-0.72)) ...
 +0.16*exp(-0.5*((x-0.88)/0.025).^2);
plot(x,f); grid on; title('TF145 — DerivativeZoo')
exportgraphics(gcf,'TF145_DerivativeZoo.png','Resolution',300);
~~~
