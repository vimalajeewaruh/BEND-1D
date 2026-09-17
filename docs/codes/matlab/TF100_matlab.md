# TF100 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.08+0.035*sin(2*pi*1.8*x);
c=[0.12 0.24 0.355 0.465 0.57 0.67 0.765 0.855 0.935];
a=[0.70 0.64 0.58 0.54 0.49 0.45 0.42 0.39 0.36];
for k=1:numel(c)
    width=0.010+0.0025*k; env=exp(-0.5*((x-c(k))/width).^2);
    localOsc=0.60*sin(2*pi*(72*x+0.8*k));
    f=f+a(k)*env.*(0.75+0.25*localOsc);
end
f=f-0.10*s(x,0.52,0.12);
plot(x,f); grid on; title('TF100 — NeuralBurstAdaptation')
exportgraphics(gcf,'TF100_NeuralBurstAdaptation.png','Resolution',300);
~~~
