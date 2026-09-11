~~~matlab
N = 1024;
x = linspace(0,1,N);
q = 1.5;
epsilon = (x-0.58)/0.025;
background = 0.35*exp(-((x-0.26)/0.12).^2);
resonance = 0.75*((q+epsilon).^2./(1+epsilon.^2)-1);
f = background + resonance;

plot(x,f,'LineWidth',1.5)
xlabel('x'); ylabel('f(x)');
title('TF006 — Fano'); grid on
exportgraphics(gcf,'TF006_Fano.png','Resolution',300);
~~~

