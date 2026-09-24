# TF187 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
phi=2*pi*12*x+0.75*pi*double(x>=0.28) ...
    -1.05*pi*double(x>=0.53)+0.60*pi*double(x>=0.78);
f=0.75*sin(phi)+0.12*sin(2*phi+0.4);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF187 — JosephsonPhaseSlips')
~~~
