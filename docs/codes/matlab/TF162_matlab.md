# TF162 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = 0.12*exp(-15*x) + 0.88*exp(-2.15*x);

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF162 — Diffusion MRI IVIM')
~~~
