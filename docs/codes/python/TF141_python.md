# TF141 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.18*x+.25*S(.68,.004)+.32*np.sqrt(np.abs(x-.27))
f+=.22*np.exp(-.5*((x-.48)/.012)**2)+.18*np.sin(2*np.pi*(7*x+18*x**2))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF141_MishMashAlpha.png',dpi=300)
~~~
