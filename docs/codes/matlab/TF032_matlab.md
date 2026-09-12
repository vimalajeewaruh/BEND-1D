~~~matlab
N = 1024; x = linspace(0,1,N);
env = 1./(1+exp(-75*(x-0.42)));
amp = 0.78+0.15*sin(2*pi*1.25*x);
f = 0.025*sin(2*pi*3*x) + env.*amp.*(sin(2*pi*18*x) ...
    + 0.24*sin(2*pi*36*x+0.65));
plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF032 — TremorOnset')
exportgraphics(gcf,'TF032_TremorOnset.png','Resolution',300);
~~~
