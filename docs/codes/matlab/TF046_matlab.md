# TF046 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
wear1 = 1-0.38*x.^0.82;
maintenance = 0.20./(1+exp(-160*(x-0.56)));
wear2 = -0.28*max(x-0.56,0);
micro = 0.018*sin(2*pi*12*x).*(1-0.4*x);
f = wear1+maintenance+wear2+micro;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF046 — PlateWear')
exportgraphics(gcf,'TF046_PlateWear.png','Resolution',300);
~~~
