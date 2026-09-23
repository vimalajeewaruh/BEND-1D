# TF155 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.12*x+0.08*log(1+6*x)+0.18*sqrt(abs(x-0.16));
f=f+0.16*(S(x,0.24,0.006)-S(x,0.36,0.006))-0.18*S(x,0.43,0.003);
f=f+0.26*exp(-0.5*((x-0.50)/0.010).^2)+0.21*exp(-0.5*((x-0.527)/0.008).^2) ...
 -0.13*exp(-0.5*((x-0.575)/0.005).^2);
f=f+0.13*sin(2*pi*(8*x+24*x.^2)).*(S(x,0.60,0.02)-S(x,0.78,0.02));
f=f+0.16*exp(-0.5*((x-0.80)/0.045).^2).*sin(2*pi*55*x);
f=f+0.28*exp(-0.5*((x-0.885)/0.035).^2)-0.26*exp(-0.5*((x-0.895)/0.037).^2) ...
 +0.09*exp(-0.5*((x-0.955)/0.0028).^2);
plot(x,f); grid on; title('TF155 — GrandMishMash')
exportgraphics(gcf,'TF155_GrandMishMash.png','Resolution',300);
~~~
