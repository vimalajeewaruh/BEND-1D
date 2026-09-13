# TF043 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
base = 0.20+0.34*x+0.035*sin(2*pi*2.2*x);
jump = 0.18./(1+exp(-180*(x-0.47)));
late = -0.22*max(x-0.47,0);
run = 0.018*sin(2*pi*17*x).*(0.35+0.65*x);
f = base+jump+late+run;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF043 — StampShadeRun')
exportgraphics(gcf,'TF043_StampShadeRun.png','Resolution',300);
~~~
