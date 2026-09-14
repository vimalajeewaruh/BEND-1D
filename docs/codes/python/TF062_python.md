# TF062 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 0.022+0.018*x+0.035*np.exp(-0.5*((x-0.73)/0.18)**2)
c = [0.11,0.24,0.365,0.492,0.510,0.675,0.82,0.905]
A = [0.28,0.62,0.40,1.00,0.72,0.35,0.78,0.24]
w = [0.0045,0.0065,0.0035,0.0050,0.0042,0.0075,0.0055,0.0030]
for ck,ak,wk in zip(c,A,w):
    f += ak*np.exp(-0.5*((x-ck)/wk)**2)
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Intensity"); plt.title("TF062 — MassSpectrum")
plt.tight_layout(); plt.savefig("TF062_MassSpectrum.png",dpi=300)
~~~
