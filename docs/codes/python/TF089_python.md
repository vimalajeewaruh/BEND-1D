# TF089 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.12+.025*x
c=[.12,.29,.47,.66,.81]; a=[.32,.26,.42,.30,.22]; r=[7,9,6,8.5,10]
for ck,ak,rk in zip(c,a,r):
    u=np.maximum(x-ck,0); f+=ak*(x>=ck)*np.exp(-rk*u)
f+=.025*np.sin(2*np.pi*4*x)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF089_AdstockCampaign.png',dpi=300)
~~~
