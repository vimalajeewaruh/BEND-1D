~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = np.zeros_like(x)
base_times = np.arange(0.075,0.971,0.112)
for k,b in enumerate(base_times):
    t = b+0.0045*np.sin(2*np.pi*k/5); u = x-t; ind = u>=0
    impact = 0.65*np.exp(-0.5*(u/0.0035)**2)
    ring = np.zeros_like(x)
    ring[ind] = np.exp(-48*u[ind])*(np.sin(2*np.pi*58*u[ind])
                + 0.32*np.sin(2*np.pi*103*u[ind]))
    f += impact+ring
plt.plot(x,f,linewidth=1.1); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF035 — BearingFault")
plt.tight_layout(); plt.savefig("TF035_BearingFault.png",dpi=300)
~~~

