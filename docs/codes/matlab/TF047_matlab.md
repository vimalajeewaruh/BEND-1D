# TF047 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 0.75+0.12*sin(2*pi*5*x+0.3)+0.07*sin(2*pi*13*x) ...
    +0.035*sin(2*pi*31*x+0.7);
d1 = 0.42*exp(-0.5*((x-0.34)/0.055).^2);
d2 = 0.30*exp(-0.5*((x-0.72)/0.035).^2);
recovery = 0.14*exp(-0.5*((x-0.43)/0.025).^2);
f = f-d1-d2+recovery;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF047 — TreeRing')
exportgraphics(gcf,'TF047_TreeRing.png','Resolution',300);
~~~
