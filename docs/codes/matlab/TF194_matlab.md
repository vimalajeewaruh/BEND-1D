# TF194 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
phase1=2*pi*(17*x+5*x.^2)+1.25*sin(2*pi*2.7*x);
phase2=2*pi*(39*x+2.5*x.^2)+0.70*sin(2*pi*5.2*x);
f=(0.58+0.25*cos(2*pi*1.8*x)).*sin(phase1)+0.24*sin(phase2);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF194 — RadarMicroDoppler')
~~~
