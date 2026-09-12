# TF035 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = zeros(size(x));
baseTimes = 0.075:0.112:0.97;
for k = 1:numel(baseTimes)
    tk = baseTimes(k)+0.0045*sin(2*pi*(k-1)/5);
    u = x-tk; ind = u>=0;
    impact = 0.65*exp(-0.5*(u/0.0035).^2);
    ring = zeros(size(x));
    ring(ind) = exp(-48*u(ind)).*(sin(2*pi*58*u(ind)) ...
        + 0.32*sin(2*pi*103*u(ind)));
    f = f+impact+ring;
end
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF035 — BearingFault')
exportgraphics(gcf,'TF035_BearingFault.png','Resolution',300);
~~~
