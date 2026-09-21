# TF122 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.02*np.ones_like(x)
c=[.08,.15,.24,.31,.405,.47,.505,.59,.69,.77,.86,.93]
a=[.22,-.18,.30,.50,-.25,.70,.42,-.35,.55,.24,-.20,.38]
w=[.030,.015,.020,.010,.012,.008,.006,.016,.004,.010,.006,.003]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF122_PeakForest.png',dpi=300)
~~~
