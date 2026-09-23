# TF169 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
S = @(z,c,w) 1./(1+exp(-(z-c)/w));
f = 1 ...
    - 0.18*S(x,0.20,0.022) ...
    - 0.38*S(x,0.49,0.030) ...
    - 0.10*S(x,0.61,0.015) ...
    - 0.25*S(x,0.77,0.020);

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF169 — TGA Decomposition')
~~~
