# TF175 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
sigma = 10; rho = 28; beta = 8/3;
dt = 0.01; burn = 1200; total = N + burn;
Y = zeros(3,total); Y(:,1) = [1;1;1];
rhs = @(v) [sigma*(v(2)-v(1)); ...
             v(1)*(rho-v(3))-v(2); ...
             v(1)*v(2)-beta*v(3)];
for k = 1:total-1
    yy = Y(:,k);
    k1 = rhs(yy);
    k2 = rhs(yy+0.5*dt*k1);
    k3 = rhs(yy+0.5*dt*k2);
    k4 = rhs(yy+dt*k3);
    Y(:,k+1) = yy + dt*(k1+2*k2+2*k3+k4)/6;
end
f = Y(1,burn+1:end);
f = f - mean(f);
f = f/max(abs(f));

plot(x,f,'LineWidth',1.2); grid on
xlabel('x'); ylabel('f(x)'); title('TF175 — Lorenz Wing Switch')
~~~
