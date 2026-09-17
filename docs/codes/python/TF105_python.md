# TF105 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.05+.01*x
c=[.16,.29,.43,.455,.67,.82]; a=[.28,.52,.72,.45,.35,.18]
for ck,ak in zip(c,a):
    u=np.maximum(x-ck,0); f+=ak*(x>=ck)*(1-np.exp(-120*u))*np.exp(-10*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF105_CalciumTransientTrain.png',dpi=300)
~~~
