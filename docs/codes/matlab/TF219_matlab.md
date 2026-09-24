# TF219 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.18+0.72*S(x,0.28,0.075)-0.82*S(x,0.79,0.012);
f=f+(0.02+0.05*S(x,0.35,0.08)).*sin(2*pi*9*x);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF219 — HeatwaveFrontBreak')
~~~
