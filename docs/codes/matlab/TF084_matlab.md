# TF084 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
u=(x-0.52)/0.115;
smooth=0.10+0.82./sqrt(1+u.^2);
planet=0.095*exp(-0.5*((x-0.585)/0.010).^2)-0.035*exp(-0.5*((x-0.605)/0.016).^2);
f=smooth+planet;
plot(x,f); grid on; title('TF084 — MicrolensingPlanet')
exportgraphics(gcf,'TF084_MicrolensingPlanet.png','Resolution',300);
~~~
