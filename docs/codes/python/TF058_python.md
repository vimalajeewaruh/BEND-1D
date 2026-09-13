# TF058 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = 0.035+0.018*x
c = [0.16,0.29,0.43,0.50,0.67,0.81,0.87]
A = [0.42,0.78,0.33,0.54,1.00,0.47,0.29]
w = [0.012,0.018,0.011,0.022,0.016,0.020,0.013]
for ck,ak,wk in zip(c,A,w):
    f += ak*np.exp(-0.5*((x-ck)/wk)**2)
f += 0.10*(x>0.67)*np.exp(-18*(x-0.67))
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Intensity"); plt.title("TF058 — Chromatogram")
plt.tight_layout(); plt.savefig("TF058_Chromatogram.png",dpi=300)
~~~
