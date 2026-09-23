# TF160 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=1-.82*(S(.35,.004)-S(.68,.004))
for c,sign in zip([.35,.68],[1,-1]):
    u=x-c; f+=sign*.15*np.exp(-.5*(u/.052)**2)*np.sin(2*np.pi*(16*u+55*u*np.abs(u)))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF160_FresnelOccultation.png',dpi=300)
~~~
