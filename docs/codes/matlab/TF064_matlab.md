# TF064 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 0.10+0.12*exp(-2.8*x)+0.075*exp(-0.5*((x-0.29)/0.095).^2);
c = [0.18 0.355 0.475 0.565 0.582 0.745 0.89];
A = [0.34 0.62 0.43 0.92 0.70 0.52 0.27];
w = [0.010 0.008 0.012 0.007 0.0075 0.010 0.006];
for k = 1:numel(c)
    f = f+A(k)*exp(-0.5*((x-c(k))/w(k)).^2);
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('Intensity'); title('TF064 — XRDPeaks')
exportgraphics(gcf,'TF064_XRDPeaks.png','Resolution',300);
~~~
