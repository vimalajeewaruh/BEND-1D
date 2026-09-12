# TF040 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = zeros(size(x));
t = [0.105 0.205 0.298 0.397 0.515 0.655 0.815 0.925];
A = [1.00 0.82 1.08 0.90 0.72 1.03 0.86 0.76];
for k = 1:numel(t)
    u1 = (x-t(k))/0.0022;
    click = A(k)*u1.*exp(-0.5*u1.^2);
    te = t(k)+0.012+0.002*sin(k);
    u2 = (x-te)/0.0030;
    echo = 0.25*A(k)*u2.*exp(-0.5*u2.^2);
    f = f+click+echo;
end
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF040 — WhaleClicks')
exportgraphics(gcf,'TF040_WhaleClicks.png','Resolution',300);
~~~
