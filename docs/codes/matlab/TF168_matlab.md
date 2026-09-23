# TF168 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
S = @(z,c,w) 1./(1+exp(-(z-c)/w));
f = 0.08 + 0.10*x ...
    - 0.095*S(x,0.23,0.012) ...
    + 0.48*exp(-0.5*((x-0.46)/0.030).^2) ...
    - 0.42*exp(-0.5*((x-0.74)/0.060).^2) ...
    - 0.12*exp(-0.5*((x-0.825)/0.028).^2);

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF168 — DSC Phase Transitions')
~~~
