# TF082 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); g=lambda c,w: np.exp(-.5*((x-c)/w)**2)
f=.015+.14*g(.18,.010)+g(.31,.014)+.34*g(.345,.027)+.42*g(.72,.020)
u=np.maximum(x-.31,0); f+=.16*(x>=.31)*np.exp(-20*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF082_PulsarProfile.png',dpi=300)
~~~
