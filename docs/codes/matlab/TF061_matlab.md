# TF061 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
B = 0.055*sin(2*pi*4.2*x+0.3)+0.028*sin(2*pi*7.1*x-0.5);
env = exp(-0.5*((x-0.56)/0.115).^2);
phase = 2*pi*(20*x+2.2*(x-0.56).^2);
f = B+0.39*env.*sin(phase);
plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF061 — EEGSpindle')
exportgraphics(gcf,'TF061_EEGSpindle.png','Resolution',300);
~~~
