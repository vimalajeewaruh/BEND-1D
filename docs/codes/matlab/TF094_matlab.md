# TF094 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
env=s(x,0.10,0.030)-s(x,0.90,0.040);
f=env.*(0.42*sin(2*pi*27*x)+0.39*sin(2*pi*29*x+0.2)+0.23*sin(2*pi*41*x-0.4));
plot(x,f); grid on; title('TF094 — ChordBeating')
exportgraphics(gcf,'TF094_ChordBeating.png','Resolution',300);
~~~
