~~~matlab
N = 1024; x = linspace(0,1,N);
phase = 2*pi*(9.0*x + 0.06*sin(2*pi*0.8*x));
pulse = 0.55*sin(phase) + 0.23*sin(2*phase-0.55) ...
    + 0.10*sin(3*phase-1.00);
onset = 1./(1+exp(-65*(x-0.56)));
f = 0.35 + 0.18*pulse + onset.*(0.48+0.18*pulse) ...
    + 0.035*sin(2*pi*1.1*x);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF028 — VasospasmTCD')
exportgraphics(gcf,'TF028_VasospasmTCD.png','Resolution',300);
~~~
