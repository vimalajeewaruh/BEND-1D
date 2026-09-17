# TF107 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.48+0.025*sin(2*pi*5*x);
f=f+0.20*(S(x,0.18,0.004)-S(x,0.39,0.004)) ...
    -0.15*(S(x,0.52,0.004)-S(x,0.66,0.004)) ...
    +0.30*(S(x,0.74,0.003)-S(x,0.79,0.003));
plot(x,f); grid on; title('TF107 — CopyNumberGenome')
exportgraphics(gcf,'TF107_CopyNumberGenome.png','Resolution',300);
~~~
