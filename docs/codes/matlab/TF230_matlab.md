# TF230 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
f=zeros(size(x));
intervals=[0 .2 4 1.00; .2 .4 3 -.85; .4 .6 2 .90; .6 .8 1.5 -.80; .8 1.0 .5 .65];
for k=1:size(intervals,1)
 aa=intervals(k,1); bb=intervals(k,2); pp=intervals(k,3); A0=intervals(k,4);
 m=x>=aa & x<=bb; s=(x(m)-aa)/(bb-aa);
 f(m)=A0*(4*s.*(1-s)).^pp;
end
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF230 — RegularityQuilt')
~~~
