# TF075 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); step=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.35+.28*x-.10*x**2+(.025+.035*x)*np.sin(2*np.pi*(8*x+3*x**2))
f+=.52*np.exp(-.5*((x-.61)/.010)**2)-.20*np.exp(-.5*((x-.635)/.016)**2)
f+=.12*(step(.72,.012)-step(.86,.018))
plt.plot(x,f); plt.grid(alpha=.3); plt.title('TF075 — MeltPoolInstability'); plt.tight_layout()
plt.savefig('TF075_MeltPoolInstability.png',dpi=300)
~~~
