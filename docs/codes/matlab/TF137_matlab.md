# TF137 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
phase1=2*pi*(18*x+3*x.^2); phase2=2*pi*(31*x-2*x.^2);
f=0.22*sin(phase1)+0.14*sin(phase2+0.5) ...
 +0.20*exp(-0.5*((x-0.58)/0.065).^2).*sin(2*pi*54*x) ...
 -0.32*exp(-0.5*((x-0.82)/0.008).^2);
plot(x,f); grid on; title('TF137 — SatelliteReactionWheel')
exportgraphics(gcf,'TF137_SatelliteReactionWheel.png','Resolution',300);
~~~
