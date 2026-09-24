# TF226 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
raw=1./((x-0.52).^2+0.015^2); f=raw/max(raw);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF226 — AnalyticNearPole')
~~~
