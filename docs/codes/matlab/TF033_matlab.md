# TF033 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = zeros(size(x));
c = 0.07:0.115:0.99;
for k = 1:numel(c)
    a = 0.92+0.08*sin(2*pi*(k-1)/numel(c));
    systolic = 1.05*exp(-0.5*((x-c(k))/0.010).^2);
    shoulder = 0.48*exp(-0.5*((x-(c(k)+0.022))/0.020).^2);
    notch = 0.23*exp(-0.5*((x-(c(k)+0.039))/0.006).^2);
    reflect = 0.20*exp(-0.5*((x-(c(k)+0.056))/0.016).^2);
    f = f+a*(systolic+shoulder-notch+reflect);
end
f = f+0.08;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF033 — ArterialPulse')
exportgraphics(gcf,'TF033_ArterialPulse.png','Resolution',300);
~~~
