# TF170 — MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
mu = 7.0;
dt = 20/(N-1);
y1 = zeros(1,N); y2 = zeros(1,N);
y1(1) = 2; y2(1) = 0;
rhs = @(a,b) [b; mu*(1-a.^2).*b-a];
for k = 1:N-1
    yy = [y1(k); y2(k)];
    k1 = rhs(yy(1),yy(2));
    q = yy + 0.5*dt*k1;
    k2 = rhs(q(1),q(2));
    q = yy + 0.5*dt*k2;
    k3 = rhs(q(1),q(2));
    q = yy + dt*k3;
    k4 = rhs(q(1),q(2));
    yn = yy + dt*(k1+2*k2+2*k3+k4)/6;
    y1(k+1) = yn(1); y2(k+1) = yn(2);
end
f = y1/max(abs(y1));

plot(x,f,'LineWidth',1.5); grid on
xlabel('x'); ylabel('f(x)'); title('TF170 — Van der Pol Relaxation')
~~~
