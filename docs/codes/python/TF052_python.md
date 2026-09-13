# TF052 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
base = 1+0.018*np.sin(2*np.pi*3*x)+0.008*np.sin(2*np.pi*11*x+0.4)
transit = -0.080*np.exp(-((x-0.39)/0.037)**8)
u = np.maximum(x-0.69,0)
flare = (x>=0.69)*0.19*(1-np.exp(-150*u))*np.exp(-18*u)
f = base+transit+flare
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Relative brightness"); plt.title("TF052 — StellarTransitFlare")
plt.tight_layout(); plt.savefig("TF052_StellarTransitFlare.png",dpi=300)
~~~
