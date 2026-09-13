# TF052 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
base = 1+0.018*sin(2*pi*3*x)+0.008*sin(2*pi*11*x+0.4);
transit = -0.080*exp(-((x-0.39)/0.037).^8);
u = max(x-0.69,0);
flare = (x>=0.69).*0.19.*(1-exp(-150*u)).*exp(-18*u);
f = base+transit+flare;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Relative brightness'); title('TF052 — StellarTransitFlare')
exportgraphics(gcf,'TF052_StellarTransitFlare.png','Resolution',300);
~~~
