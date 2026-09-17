# TF108 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.18+0.20*x+0.04*sin(2*pi*2*x);
f=f+0.38*(S(x,0.31,0.010)-S(x,0.55,0.012)) ...
    +0.24*exp(-0.5*((x-0.72)/0.030).^2) ...
    +0.08*exp(-0.5*((x-0.80)/0.012).^2);
plot(x,f); grid on; title('TF108 — SpatialTranscriptScan')
exportgraphics(gcf,'TF108_SpatialTranscriptScan.png','Resolution',300);
~~~
