# TF216 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.62*(S(x,0.08,0.008)-S(x,0.22,0.008)) ...
 -0.58*(S(x,0.68,0.008)-S(x,0.80,0.008));
u=max(x-0.80,0); f=f+(x>=0.80).*0.18.*exp(-22*u).*sin(2*pi*30*u);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF216 — ElevatorRide')
~~~
