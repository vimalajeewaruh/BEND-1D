# TF063 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = 0.025+0.010*x;
c = [0.16 0.31 0.455 0.486 0.515 0.545 0.73 0.865];
A = [0.34 0.58 0.52 0.82 1.00 0.67 0.44 0.25];
g = [0.008 0.011 0.007 0.006 0.006 0.007 0.012 0.009];
for k = 1:numel(c)
    z = (x-c(k))/g(k); f = f+A(k)./(1+z.^2);
end
z = (x-0.505)/0.055; f = f+0.075./(1+z.^2);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('Intensity'); title('TF063 — NMRMultiplet')
exportgraphics(gcf,'TF063_NMRMultiplet.png','Resolution',300);
~~~
