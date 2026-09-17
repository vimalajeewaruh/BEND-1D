# TF110 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.50+0.025*sin(2*pi*7*x)+0.012*sin(2*pi*43*x);
f=f+0.14*exp(-0.5*((x-0.39)/0.010).^2)-0.11*exp(-0.5*((x-0.69)/0.008).^2);
plot(x,f); grid on; title('TF110 — LithographyEdge')
exportgraphics(gcf,'TF110_LithographyEdge.png','Resolution',300);
~~~
