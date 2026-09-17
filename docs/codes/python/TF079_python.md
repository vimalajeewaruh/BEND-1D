# TF079 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
base=.28+.035*np.sin(2*np.pi*4*x); window=s(.34,.005)-s(.73,.005)
switching=.24*np.tanh(5*np.sin(2*np.pi*22*x)); edge=.08*np.sin(2*np.pi*7*x)*window
f=base+window*switching+edge
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF079_CacheThrash.png',dpi=300)
~~~
