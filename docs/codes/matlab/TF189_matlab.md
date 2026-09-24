# TF189 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
sech2=@(z) 1./cosh(z).^2;
f=0.66*sech2((x-0.40)/0.045)+0.66*sech2((x-0.60)/0.045) ...
 +0.82*sech2((x-0.50)/0.030).*cos(2*pi*29*(x-0.50));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF189 — SolitonCollision')
~~~
