# TF030 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = zeros(size(x));
c = [0.09 0.22 0.35 0.48 0.76 0.89];
a = [1.00 0.98 1.03 1.00 0.97 1.02];
for j = 1:numel(c)
    f = f + a(j)*(0.12*exp(-0.5*((x-(c(j)-0.036))/0.012).^2) ...
      -0.14*exp(-0.5*((x-(c(j)-0.008))/0.0045).^2) ...
      +exp(-0.5*((x-c(j))/0.0055).^2) ...
      -0.26*exp(-0.5*((x-(c(j)+0.010))/0.0060).^2) ...
      +0.30*exp(-0.5*((x-(c(j)+0.042))/0.018).^2));
end
cp = 0.595;
f = f + 1.05*exp(-0.5*((x-(cp-0.006))/0.012).^2) ...
    -0.72*exp(-0.5*((x-(cp+0.011))/0.015).^2) ...
    +0.42*exp(-0.5*((x-(cp+0.045))/0.028).^2);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF029 — PVCTrain')
exportgraphics(gcf,'TF029_PVCTrain.png','Resolution',300);
~~~
