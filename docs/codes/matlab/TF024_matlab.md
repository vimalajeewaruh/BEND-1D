~~~matlab
N = 1024;
x = linspace(0,1,N);
t = [0.10 0.24 0.39 0.44 0.67 0.83];
A = [0.70 1.00 0.55 0.85 1.15 0.65];
tau = [0.035 0.050 0.028 0.042 0.060 0.032];

f = zeros(size(x));
for k = 1:numel(t)
    u = (x-t(k))/tau(k);
    f = f + A(k)*u.*exp(1-u).*(u>=0);
end

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF024 — MuscleTwitch'); grid on
exportgraphics(gcf,'TF024_MuscleTwitch.png','Resolution',300);
~~~
