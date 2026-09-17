# TF082 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.015+0.14*exp(-0.5*((x-0.18)/0.010).^2)+exp(-0.5*((x-0.31)/0.014).^2);
f=f+0.34*exp(-0.5*((x-0.345)/0.027).^2)+0.42*exp(-0.5*((x-0.72)/0.020).^2);
u=max(x-0.31,0); f=f+0.16*(x>=0.31).*exp(-20*u);
plot(x,f); grid on; title('TF082 — PulsarProfile')
exportgraphics(gcf,'TF082_PulsarProfile.png','Resolution',300);
~~~
