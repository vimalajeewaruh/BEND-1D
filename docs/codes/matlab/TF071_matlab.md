# TF071 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
W=s(x,0.35,0.003)-s(x,0.58,0.004); u=max(x-0.58,0);
f=(1-0.42*W).*sin(2*pi*28*x) ...
 -0.85*exp(-0.5*((x-0.355)/0.0028).^2)+0.48*exp(-0.5*((x-0.365)/0.0045).^2) ...
 +(x>=0.58).*0.23.*exp(-18*u).*sin(2*pi*52*u);
plot(x,f); grid on; title('TF071 — PowerGridFault')
exportgraphics(gcf,'TF071_PowerGridFault.png','Resolution',300);
~~~
