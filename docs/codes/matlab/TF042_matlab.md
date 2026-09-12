# TF042 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
t0 = 0.285; s0 = 0.0032; u0 = (x-t0)/s0;
primary = 1.25*u0.*exp(-0.5*u0.^2);
u = x-t0; ind = u>=0; slow = zeros(size(x)); ring = zeros(size(x));
slow(ind) = 0.36*(exp(-10*u(ind))-exp(-65*u(ind)));
ring(ind) = exp(-23*u(ind)).*(0.34*sin(2*pi*72*u(ind)) ...
    + 0.14*sin(2*pi*24*u(ind)+0.55));
td = 0.475; sd = 0.0045; ud = (x-td)/sd;
delayed = 0.20*ud.*exp(-0.5*ud.^2);
f = primary+slow+ring+delayed;
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF042 — LightningSferic')
exportgraphics(gcf,'TF042_LightningSferic.png','Resolution',300);
~~~
