# TF079 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
base=0.28+0.035*sin(2*pi*4*x);
window=s(x,0.34,0.005)-s(x,0.73,0.005);
switching=0.24*tanh(5*sin(2*pi*22*x));
edge=0.08*sin(2*pi*7*x).*window;
f=base+window.*switching+edge;
plot(x,f); grid on; title('TF079 — CacheThrash')
exportgraphics(gcf,'TF079_CacheThrash.png','Resolution',300);
~~~
