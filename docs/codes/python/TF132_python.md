# TF132 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
f=.55*np.exp(-3.5*x)*np.cos(2*np.pi*18*x)
f+=.34*np.exp(-7*x)*np.cos(2*np.pi*31*x+.3)
f+=.18*np.exp(-1.2*x)*np.cos(2*np.pi*8*x-.5)
f+=.06*np.exp(-.55*x)*np.cos(2*np.pi*43*x+.8)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF132_MRFreeInductionDecay.png',dpi=300)
~~~
