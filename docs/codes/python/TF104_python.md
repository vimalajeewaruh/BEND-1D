# TF104 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
grow=(.04+.30*x)*np.sin(2*np.pi*(8*x+10*x**2))
locking=.16*np.sin(2*np.pi*2.5*x)*S(.58,.02); collapse=-.95*S(.79,.006)
f=.55+grow+locking+collapse
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF104_TokamakDisruption.png',dpi=300)
~~~
