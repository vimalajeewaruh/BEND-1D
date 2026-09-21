# TF117 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.20+.05*np.sin(2*np.pi*2*x)
for c in [.18,.42,.67,.83]: f+=.18*np.exp(-.5*((x-c)/.020)**2)
f+=.045*np.sin(2*np.pi*18*x)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF117_SecurityBeacon.png',dpi=300)
~~~
