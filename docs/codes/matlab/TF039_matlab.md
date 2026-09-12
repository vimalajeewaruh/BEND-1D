# TF039 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 0.025*sin(2*pi*1.2*x);
c = [0.28 0.405 0.515 0.612 0.700];
A = [1.00 0.78 0.61 0.47 0.34];
s = [0.028 0.024 0.022 0.020 0.018];
for k = 1:numel(c)
    u = (x-c(k))/s(k);
    f = f-A(k)./(cosh(u).^2);
end
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF039 — InternalSolitons')
exportgraphics(gcf,'TF039_InternalSolitons.png','Resolution',300);
~~~
