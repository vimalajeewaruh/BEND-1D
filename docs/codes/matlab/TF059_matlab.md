# TF059 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
B = 0.018*sin(2*pi*1.25*x)+0.010*sin(2*pi*3.1*x+0.4);
P = 0.12*exp(-0.5*((x-0.18)/0.030).^2);
Q = -0.16*exp(-0.5*((x-0.365)/0.010).^2);
R = 1.05*exp(-0.5*((x-0.392)/0.0065).^2);
S = -0.28*exp(-0.5*((x-0.418)/0.012).^2);
ST = 0.045*(1./(1+exp(-90*(x-0.455)))-1./(1+exp(-55*(x-0.58))));
T = 0.34*exp(-0.5*((x-0.68)/0.060).^2);
f = B+P+Q+R+S+ST+T;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF059 — ECGBeat')
exportgraphics(gcf,'TF059_ECGBeat.png','Resolution',300);
~~~
