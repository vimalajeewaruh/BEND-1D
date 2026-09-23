# TF141 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.18*x+0.25*S(x,0.68,0.004)+0.32*sqrt(abs(x-0.27)) ...
 +0.22*exp(-0.5*((x-0.48)/0.012).^2)+0.18*sin(2*pi*(7*x+18*x.^2));
plot(x,f); grid on; title('TF141 — MishMashAlpha')
exportgraphics(gcf,'TF141_MishMashAlpha.png','Resolution',300);
~~~
