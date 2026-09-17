# TF080 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=1.35*exp(-5.8*x)+0.24*exp(-0.65*x)+0.065;
f=f-0.065*s(x,0.34,0.006)-0.045*s(x,0.58,0.006)-0.028*s(x,0.78,0.005);
c=[0.27 0.47 0.705]; a=[0.12 0.075 0.050]; w=[0.010 0.008 0.006];
for k=1:numel(c), f=f+a(k)*exp(-0.5*((x-c(k))/w(k)).^2); end
plot(x,f); grid on; title('TF080 — TrainingLossSchedule')
exportgraphics(gcf,'TF080_TrainingLossSchedule.png','Resolution',300);
~~~
