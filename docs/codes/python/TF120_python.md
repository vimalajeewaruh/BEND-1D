# TF120 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.12+.22*x+.55*S(.50,.018)-.35*S(.72,.025)
u=np.maximum(x-.50,0); f+=(x>=.50)*.12*np.exp(-5*u)*np.sin(2*np.pi*13*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF120_InferenceQueueCollapse.png',dpi=300)
~~~
