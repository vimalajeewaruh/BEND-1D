# TF196 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
G=@(z,c,w) exp(-0.5*((z-c)/w).^2);
f=zeros(size(x));
c=[0.18 0.225 0.46 0.69 0.735 0.84]; a=[0.70 0.42 0.95 0.52 0.76 0.38];
w=[0.003 0.0025 0.0035 0.0025 0.003 0.002]; fr=[70 86 62 92 78 105];
for k=1:numel(c)
 f=f+a(k)*G(x,c(k),w(k)); u=max(x-c(k),0);
 f=f+(x>=c(k)).*(0.18*a(k)).*exp(-35*u).*sin(2*pi*fr(k)*u);
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF196 — CavitationCollapse')
~~~
