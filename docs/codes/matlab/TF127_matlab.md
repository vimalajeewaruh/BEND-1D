# TF127 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=zeros(size(x));
c=[0.16 0.33 0.515 0.535 0.72 0.88];
a=[0.35 0.52 0.95 0.70 0.42 0.20]; w=[0.010 0.012 0.008 0.008 0.014 0.010];
for k=1:numel(c)
    z=(x-c(k))/w(k); f=f+a(k)*(1-z.^2).*exp(-0.5*z.^2);
end
f=f.*exp(-0.45*x);
plot(x,f); grid on; title('TF127 — PhotoacousticAline')
exportgraphics(gcf,'TF127_PhotoacousticAline.png','Resolution',300);
~~~
