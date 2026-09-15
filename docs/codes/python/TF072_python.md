# TF072 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
f=(1+0.28*np.sin(2*np.pi*5*x-0.3))*(0.32*np.sin(2*np.pi*46*x)+0.12*np.sin(2*np.pi*92*x+0.4))
for c in np.arange(0.12,0.961,0.105):
    a=0.22+0.16*(c>0.5); u=np.maximum(x-c,0)
    f+=a*(x>=c)*np.exp(-75*u)*np.sin(2*np.pi*125*u)
plt.plot(x,f); plt.grid(alpha=.3); plt.title('TF072 — GearboxDefect'); plt.tight_layout()
plt.savefig('TF072_GearboxDefect.png',dpi=300)
~~~
