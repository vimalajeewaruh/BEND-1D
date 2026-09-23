# TF143 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.75*S(x,0.53,0.015)+0.28*exp(-0.5*((x-0.505)/0.008).^2) ...
 +0.24*exp(-0.5*((x-0.548)/0.008).^2);
plot(x,f); grid on; title('TF143 — DoubletOnCliff')
exportgraphics(gcf,'TF143_DoubletOnCliff.png','Resolution',300);
~~~
