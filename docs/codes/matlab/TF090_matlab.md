# TF090 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
pre=1+0.10*x+0.025*sin(2*pi*3*x);
crash=-0.62*s(x,0.535,0.004); rebound=0.44*s(x,0.585,0.009);
aftershock=-0.13*exp(-0.5*((x-0.665)/0.015).^2);
u=max(x-0.585,0); normalization=(x>=0.585).*0.16.*(1-exp(-4.5*u));
f=pre+crash+rebound+aftershock+normalization;
plot(x,f); grid on; title('TF090 — MarketFlashCrash')
exportgraphics(gcf,'TF090_MarketFlashCrash.png','Resolution',300);
~~~
