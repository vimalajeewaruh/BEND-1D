# TF182 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
exg=@(z,c,s,tau) 0.5*exp(s^2/(2*tau^2)-(z-c)/tau).* ...
    erfc((s^2/tau-(z-c))/(sqrt(2)*s));
e1=exg(x,0.310,0.0045,0.038);
e2=exg(x,0.347,0.0032,0.024);
e1=e1/max(e1); e2=e2/max(e2);
f=e1+0.42*e2;
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF182 — FRBScatterTail')
~~~
