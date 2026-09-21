# TF120 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.12+0.22*x+0.55*S(x,0.50,0.018)-0.35*S(x,0.72,0.025);
u=max(x-0.50,0); f=f+(x>=0.50).*0.12.*exp(-5*u).*sin(2*pi*13*u);
plot(x,f); grid on; title('TF120 — InferenceQueueCollapse')
exportgraphics(gcf,'TF120_InferenceQueueCollapse.png','Resolution',300);
~~~
