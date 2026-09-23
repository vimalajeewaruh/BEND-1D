# TF172 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
m1 = x < 0.30;
m2 = x >= 0.30 & x < 0.56;
m3 = x >= 0.56 & x < 0.82;
m4 = x >= 0.82;
f(m1) = 0.22*(1-exp(-10*x(m1)));
f(m2) = 0.209 + 0.22*(x(m2)-0.30);
u = (x(m3)-0.56)/(0.82-0.56);
f(m3) = 0.266 + 0.10*u + 0.62*u.^4;
f(m4) = 0.28 + 0.18*exp(-10*(x(m4)-0.82));

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF172 — Tertiary Creep Failure')
~~~
