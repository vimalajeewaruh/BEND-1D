# TF092 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); t0=.18; u=np.maximum(x-t0,0)
attack=1.10*(1-np.exp(-180*u))*(x>=t0)
decay=attack*(.68*np.exp(-7*u)+.32*np.exp(-24*u))
ring=(x>=t0)*.18*np.exp(-12*u)*np.sin(2*np.pi*58*u); f=decay+ring
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF092_PercussiveAttackDecay.png',dpi=300)
~~~
