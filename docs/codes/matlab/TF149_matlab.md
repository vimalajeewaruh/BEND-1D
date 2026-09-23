# TF149 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=0.02*ones(size(x));
c=[0.18 0.37 0.52 0.63 0.71 0.77 0.815 0.848 0.872 0.890];
for k=1:numel(c)
    amp=0.30*(0.87^(k-1)); width=0.025*(0.70^(k-1));
    f=f+amp*(-1)^(k+1)*exp(-0.5*((x-c(k))/width).^2);
end
plot(x,f); grid on; title('TF149 — LacunaryCascade')
exportgraphics(gcf,'TF149_LacunaryCascade.png','Resolution',300);
~~~
