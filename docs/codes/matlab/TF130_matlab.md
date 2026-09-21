# TF130 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); phase=2*pi*(7*x+1.8*x.^2);
f=0.34*sin(phase)+0.11*sin(2*phase+0.4);
centers=[0.11 0.23 0.35 0.47 0.60 0.72 0.84 0.95];
for k=1:numel(centers), f=f+0.20*exp(-0.5*((x-centers(k))/0.006).^2); end
f=f-0.38*exp(-0.5*((x-0.64)/0.018).^2)+0.20*exp(-0.5*((x-0.685)/0.030).^2);
plot(x,f); grid on; title('TF130 — WearableGaitIMU')
exportgraphics(gcf,'TF130_WearableGaitIMU.png','Resolution',300);
~~~
