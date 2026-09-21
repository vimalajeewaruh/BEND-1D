# TF114 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.12*np.sin(2*np.pi*5*x)+.035*np.sin(2*np.pi*17*x+.4)+.42*S(.57,.003)
u=np.maximum(x-.57,0); f-=(x>=.57)*.25*(1-np.exp(-5*u))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF114_GNSSMultipathSlip.png',dpi=300)
~~~
