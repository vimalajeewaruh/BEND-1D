# TF163 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
mu = [0.18 0.27 0.36 0.47 0.58 0.69 0.79];
a  = [0.18 0.15 0.24 0.19 0.31 0.13 0.10];
w  = [0.010 0.012 0.011 0.013 0.014 0.015 0.016];
for k = 1:numel(mu)
    f = f + a(k)*exp(-0.5*((x-mu(k))/w(k)).^2) ...
          - 0.52*a(k)*exp(-0.5*((x-(mu(k)-0.020))/(1.15*w(k))).^2);
end
f = f + 0.03*exp(-0.5*((x-0.10)/0.006).^2);

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF163 — Auditory Brainstem Response')
~~~
