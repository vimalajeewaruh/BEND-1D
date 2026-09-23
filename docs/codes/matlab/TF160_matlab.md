# TF160 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=1-0.82*(S(x,0.35,0.004)-S(x,0.68,0.004));
c=[0.35 0.68]; signs=[1 -1];
for k=1:2
    u=x-c(k);
    f=f+signs(k)*0.15*exp(-0.5*(u/0.052).^2).*sin(2*pi*(16*u+55*u.*abs(u)));
end
plot(x,f); grid on; title('TF160 — FresnelOccultation')
exportgraphics(gcf,'TF160_FresnelOccultation.png','Resolution',300);
~~~
