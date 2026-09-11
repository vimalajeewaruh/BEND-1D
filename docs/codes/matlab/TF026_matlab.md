~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.58;
u = x-xc;

b = 1 + 0.12*sqrt(x+0.02) + 0.025*sin(10*pi*x);
D = -0.31*(1+tanh(180*u));
R = 0.48*(1-exp(-22*u));
V = 0.09*exp(-10*u).*sin(65*pi*u);
f = b + D + (x>=xc).*(R+V);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF026 — FlashCrash'); grid on
exportgraphics(gcf,'TF026_FlashCrash.png','Resolution',300);
~~~
