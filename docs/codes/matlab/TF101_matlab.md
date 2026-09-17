# TF101 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
phase=2*pi*(10*x+1.8*x.^2+0.10*sin(2*pi*2*x));
visibility=0.92-0.28*x;
phaseJump=0.55*S(x,0.64,0.004);
f=visibility.*cos(phase+phaseJump);
plot(x,f); grid on; title('TF101 — QuantumRamseyDrift')
exportgraphics(gcf,'TF101_QuantumRamseyDrift.png','Resolution',300);
~~~
