# TF050 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
env = 1./(1+exp(-55*(x-0.29)));
carrier = sin(2*pi*(17*x+0.9*x.^2))+0.33*sin(2*pi*35*x+0.4);
burst = 1+0.55*exp(-0.5*((x-0.49)/0.045).^2) ...
    +0.42*exp(-0.5*((x-0.72)/0.035).^2);
f = env.*burst.*carrier;
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF050 — VolcanicTremor')
exportgraphics(gcf,'TF050_VolcanicTremor.png','Resolution',300);
~~~
