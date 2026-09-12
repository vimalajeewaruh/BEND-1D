# TF040 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = np.zeros_like(x)
t = [0.105,0.205,0.298,0.397,0.515,0.655,0.815,0.925]
A = [1.00,0.82,1.08,0.90,0.72,1.03,0.86,0.76]
for k,(tk,ak) in enumerate(zip(t,A),start=1):
    u1 = (x-tk)/0.0022; click = ak*u1*np.exp(-0.5*u1**2)
    te = tk+0.012+0.002*np.sin(k)
    u2 = (x-te)/0.0030; echo = 0.25*ak*u2*np.exp(-0.5*u2**2)
    f += click+echo
plt.plot(x,f,linewidth=1.1); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF040 — WhaleClicks")
plt.tight_layout(); plt.savefig("TF040_WhaleClicks.png",dpi=300)
~~~
