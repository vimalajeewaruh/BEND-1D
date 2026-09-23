# TF184 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=0.025*sin(2*pi*3*x);
c=[0.16 0.28 0.295 0.48 0.67 0.715 0.83];
a=[0.55 0.42 0.25 0.92 0.38 0.62 0.30];
w=[0.008 0.006 0.0035 0.010 0.005 0.006 0.004];
for k=1:numel(c), f=f+a(k)*G(x,c(k),w(k)); end
cc=[0.48 0.715]; aa=[0.18 0.12];
for k=1:2
 u=max(x-cc(k),0);
 f=f+(x>=cc(k)).*aa(k).*exp(-22*u).*sin(2*pi*55*u);
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF184 — MagnetarBurstStorm')
~~~
