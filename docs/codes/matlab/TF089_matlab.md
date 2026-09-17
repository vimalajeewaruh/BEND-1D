# TF089 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.12+0.025*x;
c=[0.12 0.29 0.47 0.66 0.81]; a=[0.32 0.26 0.42 0.30 0.22]; r=[7 9 6 8.5 10];
for k=1:numel(c)
    u=max(x-c(k),0); f=f+a(k)*(x>=c(k)).*exp(-r(k)*u);
end
f=f+0.025*sin(2*pi*4*x);
plot(x,f); grid on; title('TF089 — AdstockCampaign')
exportgraphics(gcf,'TF089_AdstockCampaign.png','Resolution',300);
~~~
