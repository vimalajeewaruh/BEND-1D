# TF152 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.55*exp(-0.5*((x-0.17)/0.09).^2)+0.62*exp(-0.5*((x-0.84)/0.08).^2) ...
 +0.035*sin(2*pi*19*x).*(S(x,0.35,0.02)-S(x,0.66,0.02)) ...
 +0.045*(S(x,0.49,0.003)-S(x,0.60,0.003));
plot(x,f); grid on; title('TF152 — FalseFlat')
exportgraphics(gcf,'TF152_FalseFlat.png','Resolution',300);
~~~
