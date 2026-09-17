# TF098 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.30+.12*x+.035*np.sin(2*np.pi*3*x)
c=[.15,.31,.48,.64,.79,.90]; a=[.28,.42,.22,.50,.35,.20]
tau=[.045,.065,.030,.075,.050,.028]
for ck,ak,tk in zip(c,a,tau):
    u=np.maximum(x-ck,0); f+=ak*(x>=ck)*np.exp(-u/tk)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF098_TurbiditeSequence.png',dpi=300)
~~~
