# TF197 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=exp(-2.4*x).*(sin(2*pi*15*x)+0.93*sin(2*pi*16.4*x+0.15)) ...
 +0.28*exp(-5.8*x).*sin(2*pi*33*x+0.6);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF197 — ModeBeatingDecay')
~~~
