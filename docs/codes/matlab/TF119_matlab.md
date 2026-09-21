# TF119 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.42+0.025*sin(2*pi*4*x);
f=f+0.28*(S(x,0.38,0.012)-S(x,0.70,0.018)) ...
    +0.08*sin(2*pi*12*x).*(S(x,0.42,0.015)-S(x,0.68,0.015));
plot(x,f); grid on; title('TF119 — MoELoadImbalance')
exportgraphics(gcf,'TF119_MoELoadImbalance.png','Resolution',300);
~~~
