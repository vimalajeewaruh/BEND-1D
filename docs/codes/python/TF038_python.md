# TF038 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import cumulative_trapezoid
N = 1024; x = np.linspace(0,1,N)
freq = 7+20*np.minimum(x,0.55); freq[x>0.55] = 18
phase = 2*np.pi*cumulative_trapezoid(freq,x,initial=0)
env = 0.16+0.84/(1+np.exp(-28*(x-0.33)))
f = env*(np.sin(phase)+0.16*np.sin(2*phase-0.4))
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF038 — VortexLockIn")
plt.tight_layout(); plt.savefig("TF038_VortexLockIn.png",dpi=300)
~~~
