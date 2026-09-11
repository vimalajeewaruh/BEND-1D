~~~matlab
N = 1024;
x = linspace(0,1,N);
b1 = 1.8751040687;
b3 = 7.8547574382;
xc = 0.63;

mode_shape = @(b) cosh(b*x)-cos(b*x) ...
    - ((cosh(b)+cos(b))/(sinh(b)+sin(b))) ...
      .* (sinh(b*x)-sin(b*x));

phi1 = mode_shape(b1); phi1 = phi1/max(abs(phi1));
phi3 = mode_shape(b3); phi3 = phi3/max(abs(phi3));
h = max(x-xc,0)-(1-xc)*x;
f = phi1 + 0.18*phi3 + 0.12*h;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF018 — Cantilever'); grid on
exportgraphics(gcf,'TF018_Cantilever.png','Resolution',300);
~~~
