# TF151 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.75*exp(-0.5*((x-0.50)/0.18).^2)+0.26*exp(-0.5*((x-0.58)/0.060).^2) ...
 +0.22*exp(-0.5*((x-0.605)/0.015).^2)-0.10*exp(-0.5*((x-0.610)/0.0035).^2);
plot(x,f); grid on; title('TF151 — PeakOnPeak')
exportgraphics(gcf,'TF151_PeakOnPeak.png','Resolution',300);
~~~
