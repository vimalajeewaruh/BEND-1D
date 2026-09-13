# TF055 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); t = 12*x;
absorb = 1-exp(-2.2*t);
elim = 0.78*exp(-0.24*t)+0.22*exp(-1.3*t);
f = absorb.*elim;
u = max(t-5.3,0);
f = f+(t>=5.3).*0.16.*(1-exp(-2.8*u)).*exp(-0.55*u);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Concentration'); title('TF055 — Pharmacokinetic')
exportgraphics(gcf,'TF055_Pharmacokinetic.png','Resolution',300);
~~~
