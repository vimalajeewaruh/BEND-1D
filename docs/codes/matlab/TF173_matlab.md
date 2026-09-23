# TF173 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = (0.35 + 1.05*exp(-5*x)).*sin(2*pi*8*x) ...
    + 0.48*exp(-4*x) ...
    + 0.26*exp(-5.5*x).*sin(2*pi*16*x+0.45);

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF173 — Transformer Inrush')
~~~
