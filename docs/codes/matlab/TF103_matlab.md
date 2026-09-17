# TF103 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.30+0.20*x; period=0.105; phase=mod(x,period)/period;
f=f+0.18*phase;
for c=0.18:0.12:0.90
    f=f+0.28*exp(-0.5*((x-c)/0.005).^2);
end
plot(x,f); grid on; title('TF103 — FusionELMSawtooth')
exportgraphics(gcf,'TF103_FusionELMSawtooth.png','Resolution',300);
~~~
