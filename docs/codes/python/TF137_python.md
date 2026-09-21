# TF137 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
phase1=2*np.pi*(18*x+3*x**2); phase2=2*np.pi*(31*x-2*x**2)
f=.22*np.sin(phase1)+.14*np.sin(phase2+.5)
f+=.20*np.exp(-.5*((x-.58)/.065)**2)*np.sin(2*np.pi*54*x)
f-=.32*np.exp(-.5*((x-.82)/.008)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF137_SatelliteReactionWheel.png',dpi=300)
~~~
