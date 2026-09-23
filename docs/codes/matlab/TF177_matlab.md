# TF177 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
for c = [0.025 0.50 0.975]
    u = x-c;
    f = f + exp(-0.5*(u/0.013).^2).*cos(2*pi*31*u);
end

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF177 — Boundary / Interior Twins')
~~~
