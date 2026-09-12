# TF037 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
phase = 2*np.pi*(7*x+0.035*np.sin(2*np.pi*0.9*x))
z = np.sin(phase)+0.16*np.sin(2*phase-0.5)
contact = np.maximum(z-0.48,0)
f = z-0.78*contact+0.09*np.sin(3*phase+0.3)
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF037 — RotorRub")
plt.tight_layout(); plt.savefig("TF037_RotorRub.png",dpi=300)
~~~
