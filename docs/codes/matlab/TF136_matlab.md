# TF136 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
u=max(x-0.30,0);
f=0.30+0.02*x+0.16*S(x,0.30,0.006) ...
 +(x>=0.30).*0.34.*exp(-5*u).*sin(2*pi*(10*u+4*u.^2)) ...
 -0.10*S(x,0.64,0.010);
plot(x,f); grid on; title('TF136 — GridInverterOscillation')
exportgraphics(gcf,'TF136_GridInverterOscillation.png','Resolution',300);
~~~
