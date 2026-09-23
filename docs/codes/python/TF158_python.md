# TF158 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w)); u=np.maximum(x-.34,0)
f=.08+.10*x+.72*S(.34,.004)
f+=(x>=.34)*.16*np.exp(-2.6*u)*np.sin(2*np.pi*(12*u+18*u**2))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF158_XAFSEdge.png',dpi=300)
~~~
