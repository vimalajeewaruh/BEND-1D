# TF150 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
left=0.20+0.22*sin(2*pi*2*x); roughWindow=S(x,0.33,0.008)-S(x,0.68,0.008);
rough=0.16*sin(2*pi*17*x)+0.08*sin(2*pi*41*x+0.3)+0.04*sin(2*pi*91*x-0.2);
right=0.20+0.18*cos(2*pi*2*(x-0.68));
f=left.*(1-S(x,0.33,0.008))+roughWindow.*(0.20+rough)+right.*S(x,0.68,0.008);
plot(x,f); grid on; title('TF150 — SmoothRoughSmooth')
exportgraphics(gcf,'TF150_SmoothRoughSmooth.png','Resolution',300);
~~~
