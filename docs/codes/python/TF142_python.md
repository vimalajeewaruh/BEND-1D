# TF142 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w)); u=np.maximum(x,.02)
f=.22*np.sin(2*np.pi*3*x)+.10*np.cos(2*np.pi*5*x)
f+=.14*np.sqrt(u*(1-u))*np.sin(2*np.pi*1.15/(u+.05))
f+=.20*(S(.38,.008)-S(.60,.008))-.30*np.exp(-.5*((x-.73)/.005)**2)
f+=.09*np.exp(-.5*((x-.82)/.025)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF142_MishMashBeta.png',dpi=300)
~~~
