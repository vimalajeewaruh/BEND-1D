# TF135 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.18+0.55*S(x,0.20,0.10)+0.22*S(x,0.58,0.035)-0.12*S(x,0.72,0.010) ...
 +0.015*sin(2*pi*18*x).*S(x,0.25,0.03)+0.07*S(x,0.88,0.025);
plot(x,f); grid on; title('TF135 — EVFastCharge')
exportgraphics(gcf,'TF135_EVFastCharge.png','Resolution',300);
~~~
