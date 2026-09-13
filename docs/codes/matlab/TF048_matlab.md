# TF048 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
slow = 0.34*sin(2*pi*1.25*x)+0.16*sin(2*pi*3.4*x+0.7);
fine = 0.045*sin(2*pi*27*x).*(0.7+0.3*cos(2*pi*x));
event = -0.62*exp(-0.5*((x-0.58)/0.018).^2);
step = 0.20*(1./(1+exp(-85*(x-0.62)))-1./(1+exp(-55*(x-0.76))));
f = slow+fine+event+step;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF048 — IceCore')
exportgraphics(gcf,'TF048_IceCore.png','Resolution',300);
~~~
