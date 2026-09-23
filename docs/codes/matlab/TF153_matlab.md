# TF153 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=0.58*exp(-0.5*((x-0.50)/0.18).^2)+0.15*cos(2*pi*4*(x-0.50)) ...
 +0.055*exp(-0.5*((x-0.635)/0.009).^2);
plot(x,f); grid on; title('TF153 — SymmetryBreak')
exportgraphics(gcf,'TF153_SymmetryBreak.png','Resolution',300);
~~~
