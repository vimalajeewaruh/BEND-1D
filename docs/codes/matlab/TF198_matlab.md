# TF198 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
S=@(z,c,w) 1./(1+exp(-(z-c)/w));
gate=S(x,0.30,0.003)-S(x,0.58,0.003);
chatter=gate.*tanh(2.7*sin(2*pi*47*(x-0.30)));
u=max(x-0.58,0); ring=(x>=0.58).*0.34.*exp(-18*u).*sin(2*pi*34*u);
f=0.12+0.18*x+0.48*chatter+ring;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF198 — ValveChatter')
~~~
