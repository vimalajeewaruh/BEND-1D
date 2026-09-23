# TF145 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.10*x+.28*S(.18,.0025)+.35*np.abs(x-.36)
f+=.18*(x-.55)**2*(x>=.55)+.25*np.sqrt(np.abs(x-.72))
f+=.16*np.exp(-.5*((x-.88)/.025)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF145_DerivativeZoo.png',dpi=300)
~~~
