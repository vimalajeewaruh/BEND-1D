# TF084 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); u=(x-.52)/.115
smooth=.10+.82/np.sqrt(1+u**2)
planet=.095*np.exp(-.5*((x-.585)/.010)**2)-.035*np.exp(-.5*((x-.605)/.016)**2)
f=smooth+planet
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF084_MicrolensingPlanet.png',dpi=300)
~~~
