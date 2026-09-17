# TF091 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
base=.26+.34*x+.035*np.sin(2*np.pi*4*x); W=s(.42,.006)-s(.61,.006)
stock=.18+.010*np.sin(2*np.pi*13*x)
f=base*(1-W)+stock*W+.20*s(.61,.005)-.13*s(.72,.040)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF091_InventoryStockout.png',dpi=300)
~~~
