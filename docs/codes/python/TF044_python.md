# TF044 — PYTHON Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 1+0.055*(x-0.5)+0.030*sin(2*pi*8*x)+0.012*sin(2*pi*31*x+0.4);
f = f+0.18*exp(-0.5*((x-0.63)/0.007).^2) ...
    -0.10*exp(-0.5*((x-0.648)/0.005).^2);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF044 — PerforationDrift')
exportgraphics(gcf,'TF044_PerforationDrift.png','Resolution',300);
~~~
