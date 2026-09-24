# TF227 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
u=x-0.52; au=abs(u);
f=au.^0.5+0.48*au.^(1/3).*sin(0.18./(au+0.004));
f=f-mean(f); f=f/max(abs(f));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF227 — ChirpCuspCollision')
~~~
