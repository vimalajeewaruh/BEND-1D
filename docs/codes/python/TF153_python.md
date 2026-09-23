# TF153 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
f=.58*np.exp(-.5*((x-.50)/.18)**2)+.15*np.cos(2*np.pi*4*(x-.50))
f+=.055*np.exp(-.5*((x-.635)/.009)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF153_SymmetryBreak.png',dpi=300)
~~~
