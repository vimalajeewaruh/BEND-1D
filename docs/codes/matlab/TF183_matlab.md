# TF183 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
c=0.43; u=max(x-c,0); h=double(x>=c);
phase=2*pi*(9*x+h.*(2.4*u+0.22*(1-exp(-u/0.03))+0.16*(1-exp(-u/0.18))));
f=sin(phase);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF183 — PulsarGlitchRecovery')
~~~
