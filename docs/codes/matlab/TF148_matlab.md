# TF148 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.28*sin(2*pi*18*x+0.95*S(x,0.48,0.003)) ...
 +0.20*exp(-0.5*((x-0.67)/0.035).^2).*sin(2*pi*70*x);
plot(x,f); grid on; title('TF148 — PhaseResetBurst')
exportgraphics(gcf,'TF148_PhaseResetBurst.png','Resolution',300);
~~~
