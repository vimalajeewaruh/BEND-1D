# TF222 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
xc=0.83; f=zeros(size(x)); pre=x<xc; t=max(xc-x,1e-5);
f(pre)=1-1.05*t(pre).^0.55.*(1+0.14*cos(8.5*log(t(pre))+0.4));
u=max(x-xc,0);
f(~pre)=0.24+0.42*(1-exp(-u(~pre)/0.12))+0.03*sin(2*pi*18*u(~pre)).*exp(-12*u(~pre));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF222 — BubbleLogPeriodic')
~~~
