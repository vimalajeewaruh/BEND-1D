# TF104 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
grow=(0.04+0.30*x).*sin(2*pi*(8*x+10*x.^2));
locking=0.16*sin(2*pi*2.5*x).*S(x,0.58,0.02);
collapse=-0.95*S(x,0.79,0.006);
f=0.55+grow+locking+collapse;
plot(x,f); grid on; title('TF104 — TokamakDisruption')
exportgraphics(gcf,'TF104_TokamakDisruption.png','Resolution',300);
~~~
