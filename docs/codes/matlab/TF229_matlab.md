# TF229 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
g1=1.10*G(x,0.50,0.18)+0.22*sin(2*pi*2*x);
g2=1.004*g1+0.018*G(x,0.44,0.10);
needle=G(x,0.635,0.006)-0.62*G(x,0.648,0.009);
f=g1-0.995*g2+0.16*needle; f=f/max(abs(f));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF229 — CancellationNeedle')
~~~
