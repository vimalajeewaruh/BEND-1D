# TF086 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
wander=0.34+0.055*sin(2*pi*1.4*x+0.2)+0.035*sin(2*pi*3.3*x-0.6)+0.020*x;
left=0.52*exp(-0.5*((x-0.56)/0.060).^2);
right=0.52*exp(-(x-0.56)/0.18).*(x>=0.56);
flare=left.*(x<0.56)+right;
small=0.075*exp(-0.5*((x-0.20)/0.018).^2)+0.055*exp(-0.5*((x-0.84)/0.014).^2);
f=wander+flare+small;
plot(x,f); grid on; title('TF086 — QuasarFlare')
exportgraphics(gcf,'TF086_QuasarFlare.png','Resolution',300);
~~~
