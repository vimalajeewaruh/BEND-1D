# TF097 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w)); t=500*x
ecc=.25*np.sin(2*np.pi*t/100+.2); obl=.16*np.sin(2*np.pi*t/41-.6)
precAmp=.10*(1+.55*np.sin(2*np.pi*t/100+.7)); prec=precAmp*np.sin(2*np.pi*t/23+.4)
transition=.18*(s(.62,.008)-s(.71,.025)); f=ecc+obl+prec+transition
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF097_MilankovitchCycles.png',dpi=300)
~~~
