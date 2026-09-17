# TF078 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.16+.025*np.sin(2*np.pi*3*x)+.33*(s(.36,.050)-s(.63,.020))
c=[.50,.535,.56,.585,.615]; a=[.22,.42,.30,.55,.26]; w=[.008,.006,.007,.005,.008]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
u=np.maximum(x-.63,0); f+=(x>=.63)*.22*np.exp(-10*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF078_LatencyIncident.png',dpi=300)
~~~
