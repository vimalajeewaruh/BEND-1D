# TF210 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.06+0.12*x+0.19*S(x,0.19,0.035)+0.15*S(x,0.39,0.018) ...
 +0.27*S(x,0.63,0.050)+0.12*S(x,0.84,0.020);
f=f+0.018*sin(2*pi*9*x).*(S(x,0.17,0.03)-S(x,0.88,0.03));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF210 — FungalGrowthPulse')
~~~
