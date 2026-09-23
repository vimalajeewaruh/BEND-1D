# TF167 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
S = @(z,c,w) 1./(1+exp(-(z-c)/w));
f = zeros(size(x));
loadMask = x <= 0.70;
f(loadMask) = 1.08*(x(loadMask)/0.70).^1.50;
f(loadMask) = f(loadMask) ...
    - 0.055*S(x(loadMask),0.29,0.0018) ...
    - 0.070*S(x(loadMask),0.47,0.0018);
[~,i70] = min(abs(x-0.70));
f70 = f(i70);
unloadMask = x > 0.70;
f(unloadMask) = f70*((1-x(unloadMask))/0.30).^1.32;
f = f - 0.11*exp(-0.5*((x-0.925)/0.018).^2);

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF167 — Nanoindentation Pop-In')
~~~
