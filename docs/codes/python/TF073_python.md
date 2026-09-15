# TF073 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=0.018+0.012*x
c=[.16,.34,.515,.542,.73,.88]; A=[.30,.62,1,.72,.44,.21]; w=[.010,.014,.009,.008,.017,.006]
for ck,ak,wk in zip(c,A,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
f+=.045*np.exp(-.5*((x-.64)/.09)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.title('TF073 — LidarMultiEcho'); plt.tight_layout()
plt.savefig('TF073_LidarMultiEcho.png',dpi=300)
~~~
