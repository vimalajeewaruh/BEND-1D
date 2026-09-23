# TF152 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.55*np.exp(-.5*((x-.17)/.09)**2)+.62*np.exp(-.5*((x-.84)/.08)**2)
f+=.035*np.sin(2*np.pi*19*x)*(S(.35,.02)-S(.66,.02))
f+=.045*(S(.49,.003)-S(.60,.003))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF152_FalseFlat.png',dpi=300)
~~~
