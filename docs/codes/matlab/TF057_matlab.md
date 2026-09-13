# TF057 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
diurnal = 0.36+0.11*sin(2*pi*7*x-0.5)+0.04*sin(4*pi*7*x+0.2);
episode1 = 0.62*exp(-0.5*((x-0.38)/0.030).^2);
episode2 = 0.42*exp(-0.5*((x-0.73)/0.055).^2);
f = diurnal+episode1+episode2;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Concentration'); title('TF057 — PollutionEpisode')
exportgraphics(gcf,'TF057_PollutionEpisode.png','Resolution',300);
~~~
