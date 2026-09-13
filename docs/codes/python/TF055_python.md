# TF055 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); t = 12*x
absorb = 1-np.exp(-2.2*t)
elim = 0.78*np.exp(-0.24*t)+0.22*np.exp(-1.3*t)
f = absorb*elim
u = np.maximum(t-5.3,0)
f += (t>=5.3)*0.16*(1-np.exp(-2.8*u))*np.exp(-0.55*u)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Concentration"); plt.title("TF055 — Pharmacokinetic")
plt.tight_layout(); plt.savefig("TF055_Pharmacokinetic.png",dpi=300)
~~~
