# TF124 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
p1=.30*np.exp(-.5*((x-.50)/.22)**2)*np.sin(2*np.pi*8*x)
p2=.24*np.exp(-.5*((x-.56)/.080)**2)*np.sin(2*np.pi*28*x)
p3=.17*np.exp(-.5*((x-.59)/.022)**2)*np.sin(2*np.pi*85*x); f=p1+p2+p3
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF124_NestedWavePackets.png',dpi=300)
~~~
