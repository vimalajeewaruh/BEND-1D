# TF097 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
t=500*x;
ecc=0.25*sin(2*pi*t/100+0.2); obl=0.16*sin(2*pi*t/41-0.6);
precAmp=0.10*(1+0.55*sin(2*pi*t/100+0.7));
prec=precAmp.*sin(2*pi*t/23+0.4);
transition=0.18*(s(x,0.62,0.008)-s(x,0.71,0.025));
f=ecc+obl+prec+transition;
plot(x,f); grid on; title('TF097 — MilankovitchCycles')
exportgraphics(gcf,'TF097_MilankovitchCycles.png','Resolution',300);
~~~
