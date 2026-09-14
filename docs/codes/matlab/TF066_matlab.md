# TF066 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
plateau = 1.05-0.075*x-0.020*x.^2;
phaseDrop = -0.060./(1+exp(-55*(x-0.36)));
phaseRecover = 0.036./(1+exp(-48*(x-0.50)));
shoulder = 0.018*exp(-0.5*((x-0.62)/0.050).^2);
terminal = -0.55./(1+exp(-48*(x-0.885)));
ripple = 0.006*sin(2*pi*6*x).*exp(-1.2*x);
f = plateau+phaseDrop+phaseRecover+shoulder+terminal+ripple;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Voltage'); title('TF066 — BatteryDischarge')
exportgraphics(gcf,'TF066_BatteryDischarge.png','Resolution',300);
~~~
