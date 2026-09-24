# TF220 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=1-0.62*x.^1.35+0.37*S(x,0.78,0.018)-0.08*S(x,0.92,0.03);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF220 — DroughtRecovery')
~~~
