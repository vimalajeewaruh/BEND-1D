# TF159 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w)); f=0.10*ones(size(x));
c=[0.13 0.27 0.41 0.57 0.73 0.87]; a=[0.14 0.16 0.18 0.17 0.15 0.12];
w=[0.004 0.004 0.005 0.004 0.005 0.004];
for k=1:numel(c), f=f+a(k)*S(x,c(k),w(k)); end
f=f+0.025*exp(-2.4*x).*sin(2*pi*(11*x+8*x.^2)).*(1-S(x,0.58,0.025));
plot(x,f); grid on; title('TF159 — QuantumHallPlateaus')
exportgraphics(gcf,'TF159_QuantumHallPlateaus.png','Resolution',300);
~~~
