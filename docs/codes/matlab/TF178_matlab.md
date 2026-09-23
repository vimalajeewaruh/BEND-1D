# TF178 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
centers = [0.10 0.25 0.40 0.55 0.70 0.85];
separation = [0.060 0.045 0.032 0.024 0.018 0.012];
w = 0.010;
for k = 1:numel(centers)
    f = f + exp(-0.5*((x-(centers(k)-separation(k)/2))/w).^2) ...
          + exp(-0.5*((x-(centers(k)+separation(k)/2))/w).^2);
end

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF178 — Rayleigh Doublet Ladder')
~~~
