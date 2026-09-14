# TF064 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 0.10+0.12*np.exp(-2.8*x)+0.075*np.exp(-0.5*((x-0.29)/0.095)**2)
c = [0.18,0.355,0.475,0.565,0.582,0.745,0.89]
A = [0.34,0.62,0.43,0.92,0.70,0.52,0.27]
w = [0.010,0.008,0.012,0.007,0.0075,0.010,0.006]
for ck,ak,wk in zip(c,A,w):
    f += ak*np.exp(-0.5*((x-ck)/wk)**2)
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Intensity"); plt.title("TF064 — XRDPeaks")
plt.tight_layout(); plt.savefig("TF064_XRDPeaks.png",dpi=300)
~~~
