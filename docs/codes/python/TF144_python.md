# TF144 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
f=(.65+.35*x)*.34*np.sin(2*np.pi*(8*x+26*x**2))
f+=.11*np.exp(-.5*((x-.72)/.003)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF144_NeedleInChirp.png',dpi=300)
~~~
