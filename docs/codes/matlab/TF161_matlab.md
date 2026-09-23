# TF161 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
S = @(z,c,w) 1./(1+exp(-(z-c)/w));

f = zeros(size(x));
starts = [0.01 0.205 0.400 0.595 0.790];
for k = 1:numel(starts)
    rise = starts(k) + 0.045;
    fall = starts(k) + 0.145;
    gate = S(x,rise,0.0035) - S(x,fall,0.0035);
    slope = 0.80 + 0.12*(x-rise)/(fall-rise);
    if k == 4
        slope = 0.70 + 0.34*(x-rise)/(fall-rise);
    end
    f = f + gate.*slope;
end
f = f - 0.12*exp(-0.5*((x-0.685)/0.009).^2);

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF161 — Capnogram Breaths')
~~~
