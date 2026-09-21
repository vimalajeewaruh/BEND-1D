# TF111 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=zeros(size(x));
c=[0.14 0.30 0.49 0.515 0.72 0.88]; a=[0.35 0.58 0.85 0.70 0.50 0.27];
for k=1:numel(c)
    u=max(x-c(k),0);
    f=f+a(k)*(x>=c(k)).*(1-exp(-140*u)).*exp(-18*u);
end
plot(x,f); grid on; title('TF111 — ParticlePileup')
exportgraphics(gcf,'TF111_ParticlePileup.png','Resolution',300);
~~~
