# TF125 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
g1=.85*np.exp(-.5*((x-.48)/.19)**2); g2=.82*np.exp(-.5*((x-.50)/.20)**2)
residual=.08*np.sin(2*np.pi*7*x)+.04*np.exp(-.5*((x-.62)/.010)**2)
f=g1-g2+residual
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF125_CancellationTrap.png',dpi=300)
~~~
