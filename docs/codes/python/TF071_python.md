# TF071 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); step=lambda c,w: 1/(1+np.exp(-(x-c)/w))
W=step(0.35,0.003)-step(0.58,0.004); u=np.maximum(x-0.58,0)
f=(1-0.42*W)*np.sin(2*np.pi*28*x)-0.85*np.exp(-0.5*((x-0.355)/0.0028)**2)
f+=0.48*np.exp(-0.5*((x-0.365)/0.0045)**2)+(x>=0.58)*0.23*np.exp(-18*u)*np.sin(2*np.pi*52*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.title('TF071 — PowerGridFault'); plt.tight_layout()
plt.savefig('TF071_PowerGridFault.png',dpi=300)
~~~
