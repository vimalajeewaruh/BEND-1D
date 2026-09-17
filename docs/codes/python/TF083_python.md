# TF083 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
W=s(.10,.018)-s(.79,.010); phase=2*np.pi*(5*x+4*x**2+18*x**4+38*x**7)
amp=.06+.62*x**2.8; chirp=W*amp*np.sin(phase)
u=np.maximum(x-.79,0); ring=(x>=.79)*.70*np.exp(-15*u)*np.sin(2*np.pi*52*u+.3)
f=chirp+ring
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF083_GravitationalWaveChirp.png',dpi=300)
~~~
