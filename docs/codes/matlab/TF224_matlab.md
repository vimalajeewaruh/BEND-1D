# TF224 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w)); G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=0.95-0.38*x-0.34*S(x,0.61,0.008); u=max(x-0.61,0);
f=f+(x>=0.61).*0.27.*(1-exp(-u/0.18))+0.07*G(x,0.595,0.010)-0.10*G(x,0.625,0.012);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF224 — LiquidityDrought')
~~~
