# TF144 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=(0.65+0.35*x).*0.34.*sin(2*pi*(8*x+26*x.^2)) ...
 +0.11*exp(-0.5*((x-0.72)/0.003).^2);
plot(x,f); grid on; title('TF144 — NeedleInChirp')
exportgraphics(gcf,'TF144_NeedleInChirp.png','Resolution',300);
~~~
