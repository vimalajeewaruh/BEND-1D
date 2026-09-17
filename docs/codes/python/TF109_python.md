# TF109 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.62+.11*x+.035*np.sin(2*np.pi*9*x)+.018*np.sin(2*np.pi*31*x)
f+=-.08*S(.58,.004)+.12*np.exp(-.5*((x-.76)/.010)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF109_SemiconductorMetrology.png',dpi=300)
~~~
