# TF135 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.18+.55*S(.20,.10)+.22*S(.58,.035)-.12*S(.72,.010)
f+=.015*np.sin(2*np.pi*18*x)*S(.25,.03)+.07*S(.88,.025)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF135_EVFastCharge.png',dpi=300)
~~~
