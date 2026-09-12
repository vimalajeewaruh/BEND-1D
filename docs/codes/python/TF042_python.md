# TF042 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
t0 = 0.285; s0 = 0.0032; u0 = (x-t0)/s0
primary = 1.25*u0*np.exp(-0.5*u0**2)
u = x-t0; ind = u>=0; slow = np.zeros_like(x); ring = np.zeros_like(x)
slow[ind] = 0.36*(np.exp(-10*u[ind])-np.exp(-65*u[ind]))
ring[ind] = np.exp(-23*u[ind])*(0.34*np.sin(2*np.pi*72*u[ind])
            + 0.14*np.sin(2*np.pi*24*u[ind]+0.55))
td = 0.475; sd = 0.0045; ud = (x-td)/sd
delayed = 0.20*ud*np.exp(-0.5*ud**2)
f = primary+slow+ring+delayed
plt.plot(x,f,linewidth=1.1); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF042 — LightningSferic")
plt.tight_layout(); plt.savefig("TF042_LightningSferic.png",dpi=300)
~~~
