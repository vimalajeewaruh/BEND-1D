# TF129 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); u=max(x-0.08,0);
ring=(x>=0.08).*0.32.*exp(-35*u).*sin(2*pi*68*u);
crack=0.14*exp(-0.5*((x-0.58)/0.008).^2);
backwall=0.78*exp(-0.5*((x-0.62)/0.016).^2);
reverberation=0.16*exp(-0.5*((x-0.79)/0.022).^2);
f=ring+crack+backwall+reverberation;
plot(x,f); grid on; title('TF129 — UltrasoundCrackEcho')
exportgraphics(gcf,'TF129_UltrasoundCrackEcho.png','Resolution',300);
~~~
