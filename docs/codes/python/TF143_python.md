# TF143 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.75*S(.53,.015)+.28*np.exp(-.5*((x-.505)/.008)**2)
f+=.24*np.exp(-.5*((x-.548)/.008)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF143_DoubletOnCliff.png',dpi=300)
~~~
