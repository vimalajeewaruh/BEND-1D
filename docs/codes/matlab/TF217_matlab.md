# TF217 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w)); f=0.25+0.18*x;
on=[0.05 0.28 0.52 0.76]; off=[0.18 0.41 0.65 0.89]; amp=[0.22 0.20 0.23 0.19];
for k=1:4, f=f+amp(k)*(S(x,on(k),0.018)-S(x,off(k),0.038)); end
f=f+0.025*sin(2*pi*4*x);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF217 — ThermostatCycle')
~~~
