# TF108 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
g=lambda c,w: np.exp(-.5*((x-c)/w)**2)
f=.18+.20*x+.04*np.sin(2*np.pi*2*x)
f+=.38*(S(.31,.010)-S(.55,.012))+.24*g(.72,.030)+.08*g(.80,.012)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF108_SpatialTranscriptScan.png',dpi=300)
~~~
