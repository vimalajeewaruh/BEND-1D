# TF053 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); E = zeros(size(x));
forward = x<=0.5; reverse = ~forward;
E(forward) = -1+4*x(forward); E(reverse) = 3-4*x(reverse);
f = 0.07*E;
f(forward) = f(forward)+exp(-0.5*((E(forward)-0.36)/0.18).^2);
f(reverse) = f(reverse)-0.82*exp(-0.5*((E(reverse)-0.08)/0.22).^2);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Current'); title('TF053 — CyclicVoltammetry')
exportgraphics(gcf,'TF053_CyclicVoltammetry.png','Resolution',300);
~~~
