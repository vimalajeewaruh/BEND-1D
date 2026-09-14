# TF062 — PYTHON Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 0.022+0.018*x+0.035*exp(-0.5*((x-0.73)/0.18).^2);
c = [0.11 0.24 0.365 0.492 0.510 0.675 0.82 0.905];
A = [0.28 0.62 0.40 1.00 0.72 0.35 0.78 0.24];
w = [0.0045 0.0065 0.0035 0.0050 0.0042 0.0075 0.0055 0.0030];
for k = 1:numel(c)
    f = f+A(k)*exp(-0.5*((x-c(k))/w(k)).^2);
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('Intensity'); title('TF062 — MassSpectrum')
exportgraphics(gcf,'TF062_MassSpectrum.png','Resolution',300);
~~~
