# TF131 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
background=.035*np.sin(2*np.pi*5*x)+.018*np.sin(2*np.pi*9*x+.6)
env=S(.42,.05)-S(.82,.03); phase=2*np.pi*(12*x+12*x**2)
f=background+.38*env*np.sin(phase)+.18*np.exp(-.5*((x-.36)/.008)**2)-.06*S(.84,.015)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF131_EEGSeizureOnset.png',dpi=300)
~~~
