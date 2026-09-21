# TF123 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
broad=0.80*exp(-0.5*((x-0.52)/0.20).^2);
needle=0.085*exp(-0.5*((x-0.565)/0.0035).^2);
shoulder=-0.04*exp(-0.5*((x-0.61)/0.016).^2);
f=broad+needle+shoulder;
plot(x,f); grid on; title('TF123 — HiddenNeedle')
exportgraphics(gcf,'TF123_HiddenNeedle.png','Resolution',300);
~~~
