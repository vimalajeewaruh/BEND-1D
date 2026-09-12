~~~matlab
N = 1024; x = linspace(0,1,N); shaft = 3.2; mesh = 31;
phase = 2*pi*mesh*x+0.22*sin(2*pi*shaft*x);
amp = 0.78+0.22*cos(2*pi*shaft*x);
carrier = amp.*sin(phase)+0.20*sin(2*phase-0.35);
defect = 0.70*exp(-0.5*((x-0.63)/0.035).^2).*sin(2*pi*36*x+0.8);
f = carrier+defect;
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF036 — GearDefect')
exportgraphics(gcf,'TF036_GearDefect.png','Resolution',300);
~~~
