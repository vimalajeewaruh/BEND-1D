# TF072 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=(1+0.28*sin(2*pi*5*x-0.3)).*(0.32*sin(2*pi*46*x)+0.12*sin(2*pi*92*x+0.4));
c=0.12:0.105:0.96;
for k=1:numel(c), a=0.22+0.16*(c(k)>0.5); u=max(x-c(k),0);
 f=f+a*(x>=c(k)).*exp(-75*u).*sin(2*pi*125*u); end
plot(x,f); grid on; title('TF072 — GearboxDefect')
exportgraphics(gcf,'TF072_GearboxDefect.png','Resolution',300);
~~~
