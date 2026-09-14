# TF065 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 0.018+0.025*x-0.070*exp(-0.5*((x-0.305)/0.014).^2);
contact = (x>=0.33)&(x<0.78); u = max(x-0.33,0);
f(contact) = 0.025+0.025*x(contact)+3.35*u(contact).^1.42 ...
    +0.020*sin(2*pi*9*x(contact));
post = x>=0.78;
f(post) = 0.030+0.015*(x(post)-0.78)-0.115*exp(-24*(x(post)-0.78));
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Force'); title('TF065 — AFMForceCurve')
exportgraphics(gcf,'TF065_AFMForceCurve.png','Resolution',300);
~~~
