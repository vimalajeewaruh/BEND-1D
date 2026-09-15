# TF076 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); step=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=1.02*np.exp(-1.25*x)
c=[.17,.43,.69,.865]; a=[.08,.14,.24,.11]; w=[.0035,.0045,.003,.004]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
f+=-.18*step(.705,.0025)+.010*np.sin(2*np.pi*4*x)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF076_FiberOTDR.png',dpi=300)
~~~
