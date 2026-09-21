# TF139 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=np.zeros_like(x)
c=[.15,.34,.50,.525,.72,.88]; a=[.60,.42,.50,.40,.28,.11]; w=[.012,.014,.010,.010,.016,.012]
for ck,ak,wk in zip(c,a,w):
    z=(x-ck)/wk; f+=ak*z*np.exp(-.5*z**2)
u=np.maximum(x-.72,0); f+=(x>=.72)*.07*np.exp(-9*u)*np.sin(2*np.pi*35*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF139_TerahertzLayerEcho.png',dpi=300)
~~~
