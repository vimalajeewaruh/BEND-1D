# TF092 — MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N); t0=0.18; u=max(x-t0,0);
attack=1.10*(1-exp(-180*u)).*(x>=t0);
decay=attack.*(0.68*exp(-7*u)+0.32*exp(-24*u));
ring=(x>=t0).*0.18.*exp(-12*u).*sin(2*pi*58*u);
f=decay+ring;
plot(x,f); grid on; title('TF092 — PercussiveAttackDecay')
exportgraphics(gcf,'TF092_PercussiveAttackDecay.png','Resolution',300);
~~~
