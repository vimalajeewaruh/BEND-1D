# TF181 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
xc=0.72; pre=x<xc;
A=0.12+0.88*(x/xc).^1.6;
phase=2*pi*(4*x+5*x.^2+12*x.^3+18*x.^5);
phasec=2*pi*(4*xc+5*xc^2+12*xc^3+18*xc^5);
f=zeros(size(x)); f(pre)=A(pre).*sin(phase(pre));
u=max(x-xc,0);
f(~pre)=exp(-14*u(~pre)).*sin(2*pi*42*u(~pre)+phasec);
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF181 — GWChirpRingdown')
~~~
