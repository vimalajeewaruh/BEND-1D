# TF158 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
u=max(x-0.34,0); f=0.08+0.10*x+0.72*S(x,0.34,0.004);
f=f+(x>=0.34).*0.16.*exp(-2.6*u).*sin(2*pi*(12*u+18*u.^2));
plot(x,f); grid on; title('TF158 — XAFSEdge')
exportgraphics(gcf,'TF158_XAFSEdge.png','Resolution',300);
~~~
