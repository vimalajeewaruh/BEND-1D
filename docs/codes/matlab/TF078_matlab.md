# TF078 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.16+0.025*sin(2*pi*3*x)+0.33*(s(x,0.36,0.050)-s(x,0.63,0.020));
c=[0.50 0.535 0.56 0.585 0.615]; a=[0.22 0.42 0.30 0.55 0.26];
w=[0.008 0.006 0.007 0.005 0.008];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
u=max(x-0.63,0); f=f+(x>=0.63).*0.22.*exp(-10*u);
plot(x,f); grid on; title('TF078 — LatencyIncident')
exportgraphics(gcf,'TF078_LatencyIncident.png','Resolution',300);
~~~
