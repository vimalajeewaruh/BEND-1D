# TF095 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); s=@(z,c,w) 1./(1+exp(-(z-c)/w));
env=s(x,0.07,0.025)-s(x,0.93,0.030);
ph1=2*pi*(8*x+7*x.^2); ph2=2*pi*(22*x-5*x.^2); ph3=2*pi*(38*x+4*x.^2);
f=env.*(0.42*sin(ph1)+0.27*sin(ph2+0.3)+0.14*sin(ph3-0.5));
f=f.*(0.78+0.22*exp(-0.5*((x-0.58)/0.22).^2));
plot(x,f); grid on; title('TF095 — SpeechFormantTransition')
exportgraphics(gcf,'TF095_SpeechFormantTransition.png','Resolution',300);
~~~
