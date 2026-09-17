# TF099 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
g=lambda c,w: np.exp(-.5*((x-c)/w)**2)
base=.10+.018*np.sin(2*np.pi*4*x); on=.62*g(.30,.012)
sustained=.30*(s(.31,.010)-s(.69,.018))
adapt=-.12*(1-np.exp(-6*np.maximum(x-.33,0)))*((x>=.33)&(x<.69))
secondary=.16*g(.52,.025); off=-.18*g(.71,.016)+.10*g(.755,.025)
f=base+on+sustained+adapt+secondary+off
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF099_CavefishNeuromast.png',dpi=300)
~~~
