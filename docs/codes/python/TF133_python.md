# TF133 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.06+.018*np.sin(2*np.pi*4*x)
c=[.20,.52,.77]; a=[.22,.30,.18]; w=[.070,.085,.060]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
d=[.18,.235,.49,.54,.705,.79]; b=[.16,.12,.20,.10,.08,.15]
for dk,bk in zip(d,b): f+=bk*np.exp(-.5*((x-dk)/.007)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF133_ATACChromatinAccessibility.png',dpi=300)
~~~
