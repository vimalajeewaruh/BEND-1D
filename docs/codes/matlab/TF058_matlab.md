# TF058 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = 0.035+0.018*x;
c = [0.16 0.29 0.43 0.50 0.67 0.81 0.87];
A = [0.42 0.78 0.33 0.54 1.00 0.47 0.29];
w = [0.012 0.018 0.011 0.022 0.016 0.020 0.013];
for k = 1:numel(c)
    f = f+A(k)*exp(-0.5*((x-c(k))/w(k)).^2);
end
f = f+0.10*(x>0.67).*exp(-18*(x-0.67));
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Intensity'); title('TF058 — Chromatogram')
exportgraphics(gcf,'TF058_Chromatogram.png','Resolution',300);
~~~
