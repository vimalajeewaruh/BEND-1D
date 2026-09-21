# TF130 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); phase=2*np.pi*(7*x+1.8*x**2)
f=.34*np.sin(phase)+.11*np.sin(2*phase+.4)
for c in [.11,.23,.35,.47,.60,.72,.84,.95]: f+=.20*np.exp(-.5*((x-c)/.006)**2)
f+=-.38*np.exp(-.5*((x-.64)/.018)**2)+.20*np.exp(-.5*((x-.685)/.030)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF130_WearableGaitIMU.png',dpi=300)
~~~
