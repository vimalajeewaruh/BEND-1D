# TF044 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 1+0.055*(x-0.5)+0.030*np.sin(2*np.pi*8*x)+0.012*np.sin(2*np.pi*31*x+0.4)
f += 0.18*np.exp(-0.5*((x-0.63)/0.007)**2)-0.10*np.exp(-0.5*((x-0.648)/0.005)**2)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF044 — PerforationDrift")
plt.tight_layout(); plt.savefig("TF044_PerforationDrift.png",dpi=300)
~~~
