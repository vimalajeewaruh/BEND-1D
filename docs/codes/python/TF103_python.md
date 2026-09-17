# TF103 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); period=.105
f=.30+.20*x+.18*(np.mod(x,period)/period)
for c in np.arange(.18,.901,.12): f+=.28*np.exp(-.5*((x-c)/.005)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF103_FusionELMSawtooth.png',dpi=300)
~~~
