# TF081 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
baseline=1+0.012*sin(2*pi*1.2*x);
W=s(x,0.34,0.008)-s(x,0.68,0.008);
bottom=-0.20*W;
limb=-0.035*exp(-0.5*((x-0.37)/0.022).^2)-0.035*exp(-0.5*((x-0.65)/0.022).^2);
spot=0.050*exp(-0.5*((x-0.535)/0.016).^2);
f=baseline+bottom+limb+spot;
plot(x,f); grid on; title('TF081 — ExoplanetTransitSpots')
exportgraphics(gcf,'TF081_ExoplanetTransitSpots.png','Resolution',300);
~~~
