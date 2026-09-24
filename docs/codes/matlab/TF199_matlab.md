# TF199 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
loadCurve=0.15+0.78*S(x,0.22,0.065)-0.62*S(x,0.82,0.035);
gate=S(x,0.46,0.010)-S(x,0.78,0.010);
q=18*(x-0.46); saw=2*(q-floor(q))-1;
f=loadCurve+0.17*gate.*saw;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF199 — NetworkCongestionBurst')
~~~
