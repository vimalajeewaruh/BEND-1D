# TF109 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.62+0.11*x+0.035*sin(2*pi*9*x)+0.018*sin(2*pi*31*x);
f=f-0.08*S(x,0.58,0.004)+0.12*exp(-0.5*((x-0.76)/0.010).^2);
plot(x,f); grid on; title('TF109 — SemiconductorMetrology')
exportgraphics(gcf,'TF109_SemiconductorMetrology.png','Resolution',300);
~~~
