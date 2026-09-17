# TF105 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.05+0.01*x;
c=[0.16 0.29 0.43 0.455 0.67 0.82]; a=[0.28 0.52 0.72 0.45 0.35 0.18];
for k=1:numel(c)
    u=max(x-c(k),0);
    f=f+a(k)*(x>=c(k)).*(1-exp(-120*u)).*exp(-10*u);
end
plot(x,f); grid on; title('TF105 — CalciumTransientTrain')
exportgraphics(gcf,'TF105_CalciumTransientTrain.png','Resolution',300);
~~~
