# TF067 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
bleach = 0.72*exp(-3.8*x)+0.30*exp(-0.62*x)+0.035;
recovery = 0.070*exp(-0.5*((x-0.56)/0.045).^2);
smallStep = 0.030./(1+exp(-75*(x-0.73)));
f = bleach+recovery+smallStep;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Intensity'); title('TF067 — FluorescenceBleach')
exportgraphics(gcf,'TF067_FluorescenceBleach.png','Resolution',300);
~~~
