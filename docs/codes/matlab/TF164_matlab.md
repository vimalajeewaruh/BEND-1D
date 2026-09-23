# TF164 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = zeros(size(x));
r = [0.11 0.305 0.500 0.695 0.890];
tAmp = [0.30 0.270 0.30 0.270 0.30];
for k = 1:numel(r)
    rc = r(k);
    f = f + 0.12*exp(-0.5*((x-(rc-0.060))/0.018).^2) ...
          - 0.14*exp(-0.5*((x-(rc-0.012))/0.0050).^2) ...
          + 1.00*exp(-0.5*((x-rc)/0.0042).^2) ...
          - 0.25*exp(-0.5*((x-(rc+0.012))/0.0060).^2) ...
          + tAmp(k)*exp(-0.5*((x-(rc+0.070))/0.027).^2);
end

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF164 — T-Wave Alternans')
~~~
