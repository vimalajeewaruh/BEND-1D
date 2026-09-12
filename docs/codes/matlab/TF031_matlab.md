# TF031 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 0.018*sin(2*pi*5*x);
c = [0.17 0.46 0.75]; s = [0.095 0.125 0.085]; A = [0.95 1.15 0.82];
for k = 1:numel(c)
    w = exp(-0.5*((x-c(k))/s(k)).^2).^2;
    osc = sin(2*pi*(31*x+4.5*x.^2)) + 0.52*sin(2*pi*53*x+0.7) ...
        + 0.23*sin(2*pi*79*x-0.4);
    f = f + A(k)*w.*osc;
end
plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF031 — EEGBurstSuppress')
exportgraphics(gcf,'TF031_EEGBurstSuppress.png','Resolution',300);
~~~
