# TF063 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = 0.025+0.010*x
c = [0.16,0.31,0.455,0.486,0.515,0.545,0.73,0.865]
A = [0.34,0.58,0.52,0.82,1.00,0.67,0.44,0.25]
g = [0.008,0.011,0.007,0.006,0.006,0.007,0.012,0.009]
for ck,ak,gk in zip(c,A,g):
    z = (x-ck)/gk; f += ak/(1+z**2)
z = (x-0.505)/0.055; f += 0.075/(1+z**2)
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Intensity"); plt.title("TF063 — NMRMultiplet")
plt.tight_layout(); plt.savefig("TF063_NMRMultiplet.png",dpi=300)
~~~
