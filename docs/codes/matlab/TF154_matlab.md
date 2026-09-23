# TF154 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.05*ones(size(x));
c=[0.18 0.36 0.52 0.64 0.73 0.795 0.842 0.876 0.902 0.922 0.938];
for k=1:numel(c)
    width=0.025*(0.76^(k-1)); amp=0.24*(0.93^(k-1));
    f=f+amp*(-1)^(k+1)*exp(-0.5*((x-c(k))/width).^2);
end
f=f+0.12*x.^2.*sin(2*pi*(6*x+45*x.^3));
plot(x,f); grid on; title('TF154 — CompressionStorm')
exportgraphics(gcf,'TF154_CompressionStorm.png','Resolution',300);
~~~
