# TF148 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.28*np.sin(2*np.pi*18*x+.95*S(.48,.003))
f+=.20*np.exp(-.5*((x-.67)/.035)**2)*np.sin(2*np.pi*70*x)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF148_PhaseResetBurst.png',dpi=300)
~~~
