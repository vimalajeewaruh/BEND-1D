# TF112 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); u=max(x-0.28,0);
main=0.95*(x>=0.28).*(1-exp(-170*u)).*exp(-7*u);
precursor=0.08*exp(-0.5*((x-0.245)/0.010).^2);
secondary=0.18*exp(-0.5*((x-0.62)/0.020).^2);
f=main+precursor+secondary;
plot(x,f); grid on; title('TF112 — CryogenicPulse')
exportgraphics(gcf,'TF112_CryogenicPulse.png','Resolution',300);
~~~
