# TF174 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
m1 = x < 0.42;
m2 = x >= 0.42 & x < 0.70;
m3 = x >= 0.70;
u = x(m1)/0.42;
f(m1) = 0.06 + 0.56*u.^2 + 0.12*u.^5;
f(m2) = 0.98 + 0.025*sin(2*pi*2*(x(m2)-0.42)/0.28);
u = x(m3)-0.70;
f(m3) = 0.24*(1-(x(m3)-0.70)/0.30) + 0.05 ...
    + 0.15*exp(-16*u).*sin(2*pi*34*u);

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF174 — MEMS Pull-In / Release')
~~~
