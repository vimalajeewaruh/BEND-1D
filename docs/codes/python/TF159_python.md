# TF159 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w)); f=.10*np.ones_like(x)
c=[.13,.27,.41,.57,.73,.87]; a=[.14,.16,.18,.17,.15,.12]; w=[.004,.004,.005,.004,.005,.004]
for ck,ak,wk in zip(c,a,w): f+=ak*S(ck,wk)
f+=.025*np.exp(-2.4*x)*np.sin(2*np.pi*(11*x+8*x**2))*(1-S(.58,.025))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF159_QuantumHallPlateaus.png',dpi=300)
~~~
