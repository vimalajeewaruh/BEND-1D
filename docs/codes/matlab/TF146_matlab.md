# TF146 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=zeros(size(x));
for c=0.10:0.20:0.90, f=f+0.25*exp(-0.5*((x-c)/0.030).^2); end
for c=0.15:0.10:0.95, f=f+0.16*exp(-0.5*((x-c)/0.010).^2); end
cs=0.18:0.05:0.93;
for k=1:numel(cs), f=f+0.07*(-1)^k*exp(-0.5*((x-cs(k))/0.003).^2); end
plot(x,f); grid on; title('TF146 — MultiscaleComb')
exportgraphics(gcf,'TF146_MultiscaleComb.png','Resolution',300);
~~~
