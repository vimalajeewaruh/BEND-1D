# TF060 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); u = max(x-0.07,0);
main = u.^2.15.*exp(-8.8*u); main = main/max(main);
notch = -0.115*exp(-0.5*((x-0.50)/0.012).^2);
rebound = 0.060*exp(-0.5*((x-0.545)/0.021).^2);
tail = 0.065*(x>=0.53).*exp(-4.8*(x-0.53));
f = 0.065+0.92*main+notch+rebound+tail;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF060 — ArterialPulse')
exportgraphics(gcf,'TF060_ArterialPulse.png','Resolution',300);
~~~
