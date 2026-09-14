# TF068 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
C = 0.30+0.10*x-0.055*x.^2+0.012*sin(2*pi*1.5*x);
f = C+0.095*exp(-0.5*((x-0.235)/0.007).^2) ...
    +0.24*exp(-0.5*((x-0.565)/0.045).^2) ...
    +0.13*exp(-0.5*((x-0.745)/0.010).^2) ...
    +0.10*exp(-0.5*((x-0.770)/0.009).^2) ...
    -0.075*exp(-0.5*((x-0.885)/0.012).^2);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Intensity'); title('TF068 — RadioAstronomyLine')
exportgraphics(gcf,'TF068_RadioAstronomyLine.png','Resolution',300);
~~~
