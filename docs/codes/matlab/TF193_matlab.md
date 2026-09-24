# TF193 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=0.65+0.08*sin(2*pi*1.5*x)+0.035*sin(2*pi*16*x+0.4);
c=[0.23 0.51 0.73 0.86]; a=[0.42 0.56 0.34 0.46]; w=[0.018 0.011 0.026 0.014];
for k=1:4, f=f-a(k)*G(x,c(k),w(k)); end
f=f+0.06*sin(2*pi*33*x).*G(x,0.52,0.08);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF193 — GNSSMultipathFade')
~~~
