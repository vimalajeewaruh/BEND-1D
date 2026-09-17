# TF102 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); S=@(z,c,w) 1./(1+exp(-(z-c)/w));
f=0.08+0.02*sin(2*pi*4*x);
for c=[0.24 0.47 0.71]
    f=f+0.20*exp(-0.5*((x-c)/0.020).^2);
end
f=f+0.10*(S(x,0.54,0.004)-S(x,0.64,0.006));
plot(x,f); grid on; title('TF102 — QuantumLeakageBurst')
exportgraphics(gcf,'TF102_QuantumLeakageBurst.png','Resolution',300);
~~~
