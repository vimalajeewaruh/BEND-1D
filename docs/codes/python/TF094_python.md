# TF094 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
env=s(.10,.030)-s(.90,.040)
f=env*(.42*np.sin(2*np.pi*27*x)+.39*np.sin(2*np.pi*29*x+.2)+.23*np.sin(2*np.pi*41*x-.4))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF094_ChordBeating.png',dpi=300)
~~~
