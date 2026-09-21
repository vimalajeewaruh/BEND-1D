# TF113 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.10+0.025*sin(2*pi*3*x)+0.20*S(x,0.30,0.006)-0.75*S(x,0.38,0.018);
u=max(x-0.47,0); f=f+(x>=0.47).*0.55.*(1-exp(-3.5*u));
for c=[0.52 0.61 0.69]
    f=f-0.10*exp(-0.5*((x-c)/0.012).^2);
end
plot(x,f); grid on; title('TF113 — SpaceWeatherStorm')
exportgraphics(gcf,'TF113_SpaceWeatherStorm.png','Resolution',300);
~~~
