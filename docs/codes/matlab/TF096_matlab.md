# TF096 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
amb=0.04*sin(2*pi*4*x);
bass=0.14*s(x,0.18,0.020).*sin(2*pi*9*x);
harm=0.12*s(x,0.38,0.025).*sin(2*pi*23*x+0.4);
rhythm=zeros(size(x)); beatCenters=0.42:0.085:0.96;
for k=1:numel(beatCenters)
    c=beatCenters(k); u=max(x-c,0);
    rhythm=rhythm+0.20*(x>=c).*exp(-70*u).*sin(2*pi*70*u);
end
crescendo=0.10*x.*sin(2*pi*(14*x+5*x.^2));
f=amb+bass+harm+rhythm+crescendo;
plot(x,f); grid on; title('TF096 — AudioIntro')
exportgraphics(gcf,'TF096_AudioIntro.png','Resolution',300);
~~~
