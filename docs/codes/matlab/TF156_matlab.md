# TF156 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); f=zeros(size(x));
m1=x<0.18; m2=x>=0.18 & x<0.40; m3=x>=0.40 & x<0.58;
m4=x>=0.58 & x<0.76; m5=x>=0.76;
f(m1)=1.00;
f(m2)=1.00-0.38*(x(m2)-0.18)/(0.40-0.18);
f(m3)=0.62; f(m4)=0.40; f(m5)=0.08;
plot(x,f); grid on; title('TF156 — RiemannShockFan')
exportgraphics(gcf,'TF156_RiemannShockFan.png','Resolution',300);
~~~
