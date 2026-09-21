# TF129 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); u=np.maximum(x-.08,0)
ring=(x>=.08)*.32*np.exp(-35*u)*np.sin(2*np.pi*68*u)
crack=.14*np.exp(-.5*((x-.58)/.008)**2)
backwall=.78*np.exp(-.5*((x-.62)/.016)**2)
reverberation=.16*np.exp(-.5*((x-.79)/.022)**2); f=ring+crack+backwall+reverberation
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF129_UltrasoundCrackEcho.png',dpi=300)
~~~
