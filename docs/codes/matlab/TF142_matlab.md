# TF142 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w)); u=max(x,0.02);
f=0.22*sin(2*pi*3*x)+0.10*cos(2*pi*5*x) ...
 +0.14*sqrt(u.*(1-u)).*sin(2*pi*1.15./(u+0.05)) ...
 +0.20*(S(x,0.38,0.008)-S(x,0.60,0.008)) ...
 -0.30*exp(-0.5*((x-0.73)/0.005).^2)+0.09*exp(-0.5*((x-0.82)/0.025).^2);
plot(x,f); grid on; title('TF142 — MishMashBeta')
exportgraphics(gcf,'TF142_MishMashBeta.png','Resolution',300);
~~~
