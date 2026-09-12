# TF007 — MATLAB Implementation
~~~matlab
N = 1024;
x = linspace(0,1,N);
e = 0.72;
d = 1-e;
H = 1;
a = 0;
f = zeros(size(x));

while d > 1/(10*N) && a < 1
    idx = (x >= a) & (x <= min(a+d,1));
    u = (x(idx)-a)/d;
    f(idx) = 4*H*u.*(1-u);
    a = a+d;
    d = e*d;
    H = e^2*H;
end
f(end) = 0;

plot(x,f,'LineWidth',1.3)
xlabel('x'); ylabel('f(x)');
title('TF007 — BouncingBall'); grid on
exportgraphics(gcf,'TF007_BouncingBall.png','Resolution',300);
~~~

