# TF207 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w)); G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=1-0.62*S(x,0.39,0.020)+0.30*S(x,0.79,0.055)-0.06*G(x,0.50,0.055);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF207 — StomatalClosure')
~~~
