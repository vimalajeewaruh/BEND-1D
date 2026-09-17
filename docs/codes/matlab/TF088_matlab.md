# TF088 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.08+0.68*s(x,0.37,0.055)+0.28*exp(-0.5*((x-0.52)/0.028).^2);
f=f-0.12*s(x,0.74,0.045)-0.10*max(x-0.83,0);
plot(x,f); grid on; title('TF088 — ProductLaunch')
exportgraphics(gcf,'TF088_ProductLaunch.png','Resolution',300);
~~~
