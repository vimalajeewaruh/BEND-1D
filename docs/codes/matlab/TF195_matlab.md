# TF195 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=0.12+0.72*G(x,0.55,0.22);
c=[0.21 0.37 0.49 0.58 0.74 0.79]; a=[0.18 0.28 0.20 0.34 0.23 -0.15];
w=[0.004 0.003 0.0025 0.0035 0.0028 0.004];
for k=1:numel(c), f=f+a(k)*G(x,c(k),w(k)); end
f=f+0.05*sin(2*pi*18*x).*G(x,0.58,0.20);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF195 — MeltPoolSpatter')
~~~
