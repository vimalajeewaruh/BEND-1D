~~~matlab
N = 1024; x = linspace(0,1,N);
phase = 2*pi*(7*x+0.035*sin(2*pi*0.9*x));
z = sin(phase)+0.16*sin(2*phase-0.5);
contact = max(z-0.48,0);
f = z-0.78*contact+0.09*sin(3*phase+0.3);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF037 — RotorRub')
exportgraphics(gcf,'TF037_RotorRub.png','Resolution',300);
~~~
