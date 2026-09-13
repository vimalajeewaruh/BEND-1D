# TF054 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = np.zeros_like(x)
t = [0.16,0.31,0.47,0.60,0.70,0.775,0.835,0.885,0.925,0.955]
A = [0.22,0.28,0.25,0.35,0.42,0.55,0.68,0.82,1.00,1.18]
for k,(tk,ak) in enumerate(zip(t,A),start=1):
    u = x-tk; ind = u>=0; ring = np.zeros_like(x)
    ring[ind] = ak*np.exp(-(30+8*k)*u[ind])*np.sin(2*np.pi*(45+4*k)*u[ind])
    pulse = 0.45*ak*np.exp(-0.5*(u/0.0025)**2)
    f += pulse+ring
plt.plot(x,f,linewidth=1.0); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF054 — FractureAE")
plt.tight_layout(); plt.savefig("TF054_FractureAE.png",dpi=300)
~~~
