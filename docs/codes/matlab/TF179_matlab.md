# TF179 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
centers = [0.10 0.27 0.45 0.65 0.85];
widths = [0.005 0.008 0.013 0.022 0.037];
wref = 0.013;
for k = 1:numel(centers)
    z = (x-centers(k))/widths(k);
    A = sqrt(wref/widths(k));
    f = f + A*(1-z.^2).*exp(-0.5*z.^2);
end

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF179 — Equal-Energy Scale Ladder')
~~~
