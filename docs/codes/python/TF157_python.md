# TF157 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w)); u=np.maximum(x-.34,0)
f=.12+.07*x+.64*S(.34,.006)
f+=(x>=.34)*.22*np.exp(-7.5*u)*np.sin(2*np.pi*(17*u+12*u**2))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF157_DispersiveHydraulicJump.png',dpi=300)
~~~
