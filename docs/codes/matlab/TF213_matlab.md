# TF213 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=exp(-2.3*x).*(sin(2*pi*11*x)+0.92*sin(2*pi*11.75*x+0.12)) ...
 +0.35*exp(-6.9*x).*sin(2*pi*27.3*x+0.5);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF213 — BellBeating')
~~~
