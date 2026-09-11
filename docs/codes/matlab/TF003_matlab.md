~~~matlab
N = 1024;
x = linspace(0,1,N);
b = [0 0.16 0.34 0.52 0.73 1];
h = [0.80 1.15 0.75 1.35 0.95];
f = zeros(size(x));

for k = 1:numel(h)
    idx = (x >= b(k)) & (x < b(k+1));
    f(idx) = h(k)*(x(idx)-b(k))/(b(k+1)-b(k));
end
f(end) = 0;

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('f(x)');
title('TF003 — StickSlip'); grid on
exportgraphics(gcf,'TF003_StickSlip.png','Resolution',300);
~~~
