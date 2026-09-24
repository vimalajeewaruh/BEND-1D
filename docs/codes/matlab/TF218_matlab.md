# TF218 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
u=max(x-0.12,0); main=(x>=0.12).*(u/0.16).^2.*exp(2-u/0.16); main=main/max(main);
f=0.12+0.82*main+0.16*G(x,0.43,0.025)+0.12*G(x,0.58,0.032)-0.07*G(x,0.71,0.018);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF218 — AtmosphericRiver')
~~~
