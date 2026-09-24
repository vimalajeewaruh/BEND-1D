# TF228 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
u=x-0.57; au=abs(u);
f=au.^0.34.*(1+0.62*sin(10.5*log(au+0.0025)));
f=f-mean(f); f=f/max(abs(f));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF228 — LogPeriodicCusp')
~~~
