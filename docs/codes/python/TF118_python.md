# TF118 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.20+.55*S(.28,.060)-.22*S(.64,.008)+.06*np.sin(2*np.pi*8*x)*S(.64,.010)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF118_GPUThermalThrottle.png',dpi=300)
~~~
