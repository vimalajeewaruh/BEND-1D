# TF131 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
background=0.035*sin(2*pi*5*x)+0.018*sin(2*pi*9*x+0.6);
env=S(x,0.42,0.05)-S(x,0.82,0.03); phase=2*pi*(12*x+12*x.^2);
f=background+0.38*env.*sin(phase)+0.18*exp(-0.5*((x-0.36)/0.008).^2)-0.06*S(x,0.84,0.015);
plot(x,f); grid on; title('TF131 — EEGSeizureOnset')
exportgraphics(gcf,'TF131_EEGSeizureOnset.png','Resolution',300);
~~~
