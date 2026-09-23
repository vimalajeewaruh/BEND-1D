# TF151 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
f=.75*np.exp(-.5*((x-.50)/.18)**2)+.26*np.exp(-.5*((x-.58)/.060)**2)
f+=.22*np.exp(-.5*((x-.605)/.015)**2)-.10*np.exp(-.5*((x-.610)/.0035)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF151_PeakOnPeak.png',dpi=300)
~~~
