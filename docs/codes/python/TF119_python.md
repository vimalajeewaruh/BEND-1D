# TF119 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.42+.025*np.sin(2*np.pi*4*x)
f+=.28*(S(.38,.012)-S(.70,.018))+.08*np.sin(2*np.pi*12*x)*(S(.42,.015)-S(.68,.015))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF119_MoELoadImbalance.png',dpi=300)
~~~
