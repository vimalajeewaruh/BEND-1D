# TF101 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
phase=2*np.pi*(10*x+1.8*x**2+.10*np.sin(2*np.pi*2*x))
visibility=.92-.28*x; phase_jump=.55*S(.64,.004)
f=visibility*np.cos(phase+phase_jump)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF101_QuantumRamseyDrift.png',dpi=300)
~~~
