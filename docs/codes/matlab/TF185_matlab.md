# TF185 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
amp=0.45+0.35*S(x,0.18,0.06)-0.22*S(x,0.78,0.05);
phase=2*pi*(10*x+8*x.^2+1.8*x.^3)+0.7*sin(2*pi*1.3*x);
f=amp.*sin(phase);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF185 — XrayQPODrift')
~~~
