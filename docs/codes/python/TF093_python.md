# TF093 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
env=s(.12,.025)-s(.88,.035); phase=2*np.pi*(30*x+.75*np.sin(2*np.pi*5.5*x))
amp=.72+.14*np.sin(2*np.pi*2.2*x); f=env*amp*np.sin(phase)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF093_VibratoTone.png',dpi=300)
~~~
