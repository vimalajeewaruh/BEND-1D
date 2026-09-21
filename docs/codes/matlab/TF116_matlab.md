# TF116 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.10+0.018*sin(2*pi*3*x);
for c=0.10:0.11:0.90
    u=max(x-c,0);
    f=f+0.24*(x>=c).*exp(-60*u).*sin(2*pi*75*u);
end
f=f+0.055*exp(-0.5*((x-0.54)/0.010).^2);
plot(x,f); grid on; title('TF116 — SideChannelPower')
exportgraphics(gcf,'TF116_SideChannelPower.png','Resolution',300);
~~~
