# TF085 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
prec=0.08*exp(-0.5*((x-0.30)/0.010).^2)+0.12*exp(-0.5*((x-0.345)/0.007).^2)+0.07*exp(-0.5*((x-0.385)/0.006).^2);
rise=0.90*s(x,0.46,0.008); u=max(x-0.49,0);
decay=(x>=0.49).*(0.58*exp(-5.2*u)+0.32*exp(-18*u));
f=0.08+prec+rise; post=x>=0.49; f(post)=0.08+decay(post);
f=f+0.055*exp(-0.5*((x-0.64)/0.018).^2);
plot(x,f); grid on; title('TF085 — SolarFlare')
exportgraphics(gcf,'TF085_SolarFlare.png','Resolution',300);
~~~
