~~~matlab
N = 1024; x = linspace(0,1,N);
freq = 7+20*min(x,0.55); freq(x>0.55) = 18;
phase = 2*pi*cumtrapz(x,freq);
env = 0.16+0.84./(1+exp(-28*(x-0.33)));
f = env.*(sin(phase)+0.16*sin(2*phase-0.4));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF038 — VortexLockIn')
exportgraphics(gcf,'TF038_VortexLockIn.png','Resolution',300);
~~~
