# TF146 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=np.zeros_like(x)
for c in np.arange(.10,.901,.20): f+=.25*np.exp(-.5*((x-c)/.030)**2)
for c in np.arange(.15,.951,.10): f+=.16*np.exp(-.5*((x-c)/.010)**2)
for k,c in enumerate(np.arange(.18,.931,.05),start=1):
    f+=.07*(-1)**k*np.exp(-.5*((x-c)/.003)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF146_MultiscaleComb.png',dpi=300)
~~~
