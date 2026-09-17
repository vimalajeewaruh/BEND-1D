# TF107 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.48+.025*np.sin(2*np.pi*5*x)
f+=.20*(S(.18,.004)-S(.39,.004))-.15*(S(.52,.004)-S(.66,.004))
f+=.30*(S(.74,.003)-S(.79,.003))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF107_CopyNumberGenome.png',dpi=300)
~~~
