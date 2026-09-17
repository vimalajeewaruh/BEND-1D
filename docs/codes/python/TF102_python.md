# TF102 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.08+.02*np.sin(2*np.pi*4*x)
for c in [.24,.47,.71]: f+=.20*np.exp(-.5*((x-c)/.020)**2)
f+=.10*(S(.54,.004)-S(.64,.006))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF102_QuantumLeakageBurst.png',dpi=300)
~~~
