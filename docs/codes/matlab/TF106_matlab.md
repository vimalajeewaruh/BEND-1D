# TF106 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
levels=[0.72 0.50 0.64 0.39 0.58 0.46]; edges=[0 0.16 0.31 0.50 0.67 0.82 1];
f=zeros(size(x));
for k=1:numel(levels)
    idx=x>=edges(k) & x<edges(k+1); f(idx)=levels(k);
end
f(x>=edges(end-1))=levels(end);
f=f+0.05*exp(-0.5*((x-0.545)/0.008).^2)-0.10*exp(-0.5*((x-0.735)/0.004).^2);
plot(x,f); grid on; title('TF106 — NanoporeCurrent')
exportgraphics(gcf,'TF106_NanoporeCurrent.png','Resolution',300);
~~~
