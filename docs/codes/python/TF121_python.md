# TF121 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
cusp=.45*np.sqrt(np.abs(x-.30)); chirp=.22*np.sin(2*np.pi*(8*x+18*x**2))
step=.28*S(.68,.004); trend=.10*x; f=cusp+chirp+step+trend
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF121_CuspChirpStep.png',dpi=300)
~~~
