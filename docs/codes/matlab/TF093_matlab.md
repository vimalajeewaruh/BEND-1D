# TF093 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
env=s(x,0.12,0.025)-s(x,0.88,0.035);
phase=2*pi*(30*x+0.75*sin(2*pi*5.5*x));
amp=0.72+0.14*sin(2*pi*2.2*x);
f=env.*amp.*sin(phase);
plot(x,f); grid on; title('TF093 — VibratoTone')
exportgraphics(gcf,'TF093_VibratoTone.png','Resolution',300);
~~~
