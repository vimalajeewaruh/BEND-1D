# TF180 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
centers = [0.10 0.29 0.49 0.69 0.89];
alpha = [0.25 0.50 1.00 1.50 2.50];
w = 0.040;
for k = 1:numel(centers)
    z = (x-centers(k))/w;
    phi = exp(-0.5*z.^2).*(1-0.62*abs(z).^alpha(k));
    phi = phi/max(abs(phi));
    f = f + 0.42*phi;
end

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF180 — Hölder Ladder')
~~~
