# TF127 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=np.zeros_like(x)
c=[.16,.33,.515,.535,.72,.88]; a=[.35,.52,.95,.70,.42,.20]
w=[.010,.012,.008,.008,.014,.010]
for ck,ak,wk in zip(c,a,w):
    z=(x-ck)/wk; f+=ak*(1-z**2)*np.exp(-.5*z**2)
f*=np.exp(-.45*x)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF127_PhotoacousticAline.png',dpi=300)
~~~
