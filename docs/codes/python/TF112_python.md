# TF112 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); u=np.maximum(x-.28,0)
main=.95*(x>=.28)*(1-np.exp(-170*u))*np.exp(-7*u)
precursor=.08*np.exp(-.5*((x-.245)/.010)**2)
secondary=.18*np.exp(-.5*((x-.62)/.020)**2); f=main+precursor+secondary
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF112_CryogenicPulse.png',dpi=300)
~~~
