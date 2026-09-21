# TF115 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.78+.08*x
c=[.22,.46,.59,.625,.81]; a=[.12,.25,.18,.14,.08]; w=[.030,.040,.018,.016,.024]
for ck,ak,wk in zip(c,a,w): f-=ak*np.exp(-.5*((x-ck)/wk)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF115_HyperspectralMineral.png',dpi=300)
~~~
