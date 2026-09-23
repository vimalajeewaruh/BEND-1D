# TF165 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
phase = [0.2 1.1 2.0 0.7 2.7 1.6 0.4 2.3 1.3];
for m = 0:8
    freq = 2^m;
    amp = 0.13*2^(-m/3);
    f = f + amp*sin(2*pi*freq*x + phase(m+1));
end
f = f + 0.20*exp(-0.5*((x-0.24)/0.055).^2).*sin(2*pi*73*x+0.3) ...
      + 0.16*exp(-0.5*((x-0.56)/0.040).^2).*sin(2*pi*119*x+1.1) ...
      + 0.13*exp(-0.5*((x-0.81)/0.028).^2).*sin(2*pi*181*x+0.8);

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF165 — Turbulence Intermittency')
~~~
