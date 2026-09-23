# TF157 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
u=max(x-0.34,0); f=0.12+0.07*x+0.64*S(x,0.34,0.006);
f=f+(x>=0.34).*0.22.*exp(-7.5*u).*sin(2*pi*(17*u+12*u.^2));
plot(x,f); grid on; title('TF157 — DispersiveHydraulicJump')
exportgraphics(gcf,'TF157_DispersiveHydraulicJump.png','Resolution',300);
~~~
