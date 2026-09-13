# TF054 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = zeros(size(x));
t = [0.16 0.31 0.47 0.60 0.70 0.775 0.835 0.885 0.925 0.955];
A = [0.22 0.28 0.25 0.35 0.42 0.55 0.68 0.82 1.00 1.18];
for k = 1:numel(t)
    u = x-t(k); ind = u>=0; ring = zeros(size(x));
    ring(ind) = A(k)*exp(-(30+8*k)*u(ind)).*sin(2*pi*(45+4*k)*u(ind));
    pulse = 0.45*A(k)*exp(-0.5*(u/0.0025).^2);
    f = f+pulse+ring;
end
plot(x,f,'LineWidth',1.0); grid on
xlabel('x'); ylabel('f(x)'); title('TF054 — FractureAE')
exportgraphics(gcf,'TF054_FractureAE.png','Resolution',300);
~~~
