# TF091 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
base=0.26+0.34*x+0.035*sin(2*pi*4*x);
W=s(x,0.42,0.006)-s(x,0.61,0.006);
stock=0.18+0.010*sin(2*pi*13*x);
f=base.*(1-W)+stock.*W+0.20*s(x,0.61,0.005)-0.13*s(x,0.72,0.040);
plot(x,f); grid on; title('TF091 — InventoryStockout')
exportgraphics(gcf,'TF091_InventoryStockout.png','Resolution',300);
~~~
