# TF088 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.08+.68*s(.37,.055)+.28*np.exp(-.5*((x-.52)/.028)**2)
f-=.12*s(.74,.045)+.10*np.maximum(x-.83,0)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF088_ProductLaunch.png',dpi=300)
~~~
