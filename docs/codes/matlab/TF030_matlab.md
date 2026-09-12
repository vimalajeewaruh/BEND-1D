# TF030 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); env = zeros(size(x));
episode = [0.00 0.26; 0.34 0.60; 0.68 0.94];
for k = 1:size(episode,1)
    a = episode(k,1); b = episode(k,2);
    ind = x>=a & x<=b; u = (x(ind)-a)/(b-a);
    env(ind) = sin(pi*u).^1.65;
end
phase = 2*pi*(12*x+0.55*x.^2);
f = env.*(sin(phase)+0.13*sin(2*phase-0.35));
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF030 — CheyneStokes')
exportgraphics(gcf,'TF030_CheyneStokes.png','Resolution',300);
~~~
