# TF053 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); forward = x<=0.5
E = np.where(forward,-1+4*x,3-4*x)
f = 0.07*E
f[forward] += np.exp(-0.5*((E[forward]-0.36)/0.18)**2)
f[~forward] -= 0.82*np.exp(-0.5*((E[~forward]-0.08)/0.22)**2)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Current"); plt.title("TF053 — CyclicVoltammetry")
plt.tight_layout(); plt.savefig("TF053_CyclicVoltammetry.png",dpi=300)
~~~
