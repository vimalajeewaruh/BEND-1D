# TF190 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.10+0.04*x; c=[0.16 0.38 0.60]; a=[0.35 0.33 0.30]; tau=[0.025 0.060 0.120];
for k=1:3
 u=max(x-c(k),0); f=f+(x>=c(k)).*a(k).*exp(-u/tau(k));
end
f=f-0.48*S(x,0.83,0.006)+0.20*S(x,0.89,0.025);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF190 — CriticalSlowing')
~~~
