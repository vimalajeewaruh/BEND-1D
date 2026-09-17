# TF098 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.30+0.12*x+0.035*sin(2*pi*3*x);
c=[0.15 0.31 0.48 0.64 0.79 0.90]; a=[0.28 0.42 0.22 0.50 0.35 0.20];
tau=[0.045 0.065 0.030 0.075 0.050 0.028];
for k=1:numel(c)
    u=max(x-c(k),0); f=f+a(k)*(x>=c(k)).*exp(-u/tau(k));
end
plot(x,f); grid on; title('TF098 — TurbiditeSequence')
exportgraphics(gcf,'TF098_TurbiditeSequence.png','Resolution',300);
~~~
