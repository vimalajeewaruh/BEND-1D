# TF176 — MATLAB Implementation

~~~matlab
N = 4096;
x = linspace(0,1,N);
f = zeros(size(x));
idx = [512 1409 2306 3203];
centers = (idx-1)/(N-1);
for k = 1:numel(centers)
    u = x-centers(k);
    f = f + exp(-0.5*(u/0.014).^2).*cos(2*pi*34*u);
end

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF176 — Dyadic Phase Twins')
~~~
