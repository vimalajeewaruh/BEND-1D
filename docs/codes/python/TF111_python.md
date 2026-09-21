# TF111 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=np.zeros_like(x)
c=[.14,.30,.49,.515,.72,.88]; a=[.35,.58,.85,.70,.50,.27]
for ck,ak in zip(c,a):
    u=np.maximum(x-ck,0); f+=ak*(x>=ck)*(1-np.exp(-140*u))*np.exp(-18*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF111_ParticlePileup.png',dpi=300)
~~~
