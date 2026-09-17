# TF087 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
season=0.34+0.055*x+0.065*sin(2*pi*5*x-0.4)+0.025*sin(2*pi*10*x);
promo=0.36*(s(x,0.34,0.010)-s(x,0.58,0.016));
stockout=-0.25*(s(x,0.48,0.006)-s(x,0.535,0.006));
u=max(x-0.58,0); carry=(x>=0.58).*0.15.*exp(-8*u);
f=season+promo+stockout+carry;
plot(x,f); grid on; title('TF087 — PromoDemand')
exportgraphics(gcf,'TF087_PromoDemand.png','Resolution',300);
~~~
