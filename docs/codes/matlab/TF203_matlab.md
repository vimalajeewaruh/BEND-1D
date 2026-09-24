# TF203 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
u=max(x-0.25,0);
resp=(x>=0.25).*(1-exp(-u/0.014)).*exp(-u/0.22);
f=1-0.72*resp+0.10*G(x,0.68,0.07);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF203 — PupilLightReflex')
~~~
