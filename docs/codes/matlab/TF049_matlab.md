# TF049 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 0.01*sin(2*pi*4*x);
wP = exp(-0.5*((x-0.25)/0.028).^2);
P = 0.42*wP.*sin(2*pi*(38*x+24*x.^2));
wS = exp(-0.5*((x-0.43)/0.055).^2);
S = wS.*(sin(2*pi*24*x)+0.28*sin(2*pi*51*x+0.5));
u = max(x-0.47,0);
C = (x>=0.47).*0.40.*exp(-4.8*u).*(sin(2*pi*31*u)+0.35*sin(2*pi*59*u+0.6));
f = f+P+S+C;
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF049 — Seismogram')
exportgraphics(gcf,'TF049_Seismogram.png','Resolution',300);
~~~
