# TF171 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = 0.015*sin(2*pi*3*x) + ...
    0.10*exp(-0.5*((x-0.24)/0.025).^2).*sin(2*pi*42*x);
u = max(x-0.39,0);
env = (x>=0.39).*exp(-0.5*((x-0.64)/0.16).^2);
f = f + 0.48*env.*sin(2*pi*(34*u-10*u.^2));
uCoda = max(x-0.72,0);
f = f + (x>=0.72).*0.10.*exp(-9*uCoda).*sin(2*pi*48*uCoda);

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF171 — Seismic Dispersive Wave')
~~~
