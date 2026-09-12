~~~matlab
N = 1024; x = linspace(0,1,N);
env = 0.08+0.92./(1+exp(-35*(x-0.32)));
osc = 0.62*sin(2*pi*(24*x+17*x.^2)) ...
    + 0.38*sin(2*pi*(49*x+0.80*sin(2*pi*1.3*x))) ...
    + 0.23*sin(2*pi*83*x+0.35) + 0.12*sin(2*pi*121*x-0.8);
f = env.*osc;
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF034 — EMGRecruitment')
exportgraphics(gcf,'TF034_EMGRecruitment.png','Resolution',300);
~~~
