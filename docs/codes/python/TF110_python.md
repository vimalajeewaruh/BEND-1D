# TF110 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
f=.50+.025*np.sin(2*np.pi*7*x)+.012*np.sin(2*np.pi*43*x)
f+=.14*np.exp(-.5*((x-.39)/.010)**2)-.11*np.exp(-.5*((x-.69)/.008)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF110_LithographyEdge.png',dpi=300)
~~~
