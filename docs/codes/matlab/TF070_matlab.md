# TF070 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
s = @(z,c,w) 1./(1+exp(-(z-c)/w));
f = 0.48+0.10*x+0.025*sin(2*pi*3*x);
f = f+0.30*s(x,0.18,0.004)-0.40*s(x,0.39,0.005) ...
    +0.26*s(x,0.64,0.0045)-0.20*s(x,0.82,0.004);
thin = 0.24*(s(x,0.515,0.0028)-s(x,0.548,0.0028));
f = f+thin+0.020*sin(2*pi*17*x).*(x>0.18 & x<0.82);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Log response'); title('TF070 — WellLog')
exportgraphics(gcf,'TF070_WellLog.png','Resolution',300);
~~~
