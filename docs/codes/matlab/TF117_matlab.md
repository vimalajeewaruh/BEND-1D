# TF117 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.20+0.05*sin(2*pi*2*x);
for c=[0.18 0.42 0.67 0.83]
    f=f+0.18*exp(-0.5*((x-c)/0.020).^2);
end
f=f+0.045*sin(2*pi*18*x);
plot(x,f); grid on; title('TF117 — SecurityBeacon')
exportgraphics(gcf,'TF117_SecurityBeacon.png','Resolution',300);
~~~
