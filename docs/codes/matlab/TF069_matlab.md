# TF069 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
mixed = 1.00-0.025*x;
thermo = -0.62./(1+exp(-42*(x-0.43)));
deep = -0.14*max(x-0.46,0);
inversion = 0.075*exp(-0.5*((x-0.69)/0.035).^2);
fine = 0.015*sin(2*pi*10*x).*exp(-0.5*((x-0.46)/0.20).^2);
f = mixed+thermo+deep+inversion+fine;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Temperature-like value'); title('TF069 — OceanThermocline')
exportgraphics(gcf,'TF069_OceanThermocline.png','Resolution',300);
~~~
