# TF140 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.18+.16*x+.05*np.sin(2*np.pi*1.5*x)
for c in [.18,.34,.52,.76]: f+=.16*np.exp(-.5*((x-c)/.025)**2)
u=np.maximum(x-.62,0); f+=.10*S(.62,.004)+(x>=.62)*.10*np.exp(-12*u)*np.sin(2*np.pi*28*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF140_BridgeStrainEvent.png',dpi=300)
~~~
