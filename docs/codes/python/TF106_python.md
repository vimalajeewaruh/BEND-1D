# TF106 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
levels=[.72,.50,.64,.39,.58,.46]; edges=[0,.16,.31,.50,.67,.82,1]
f=np.zeros_like(x)
for k,level in enumerate(levels): f[(x>=edges[k])&(x<edges[k+1])]=level
f[x>=edges[-2]]=levels[-1]
f+=.05*np.exp(-.5*((x-.545)/.008)**2)-.10*np.exp(-.5*((x-.735)/.004)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF106_NanoporeCurrent.png',dpi=300)
~~~
