# TF209 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.12+0.78*(S(x,0.08,0.025)-S(x,0.38,0.050)) ...
 +0.72*(S(x,0.57,0.022)-S(x,0.88,0.060))+0.025*sin(2*pi*5*x);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF209 — LeafNyctinasty')
~~~
