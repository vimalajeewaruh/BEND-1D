# TF077 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.25+0.08*sin(2*pi*2*x)+0.045*x;
f=f+0.28*(s(x,0.20,0.012)-s(x,0.40,0.018));
f=f+0.34*(s(x,0.57,0.015)-s(x,0.83,0.020));
c=[0.235 0.275 0.338 0.615 0.658 0.705 0.774];
a=[0.18 0.11 0.21 0.16 0.25 0.14 0.22];
w=[0.009 0.006 0.010 0.008 0.011 0.006 0.009];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
plot(x,f); grid on; title('TF077 — NetworkTrafficBursts')
exportgraphics(gcf,'TF077_NetworkTrafficBursts.png','Resolution',300);
~~~
