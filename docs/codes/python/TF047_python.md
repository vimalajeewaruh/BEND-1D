# TF047 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = (0.75+0.12*np.sin(2*np.pi*5*x+0.3)+0.07*np.sin(2*np.pi*13*x)
     +0.035*np.sin(2*np.pi*31*x+0.7))
d1 = 0.42*np.exp(-0.5*((x-0.34)/0.055)**2)
d2 = 0.30*np.exp(-0.5*((x-0.72)/0.035)**2)
recovery = 0.14*np.exp(-0.5*((x-0.43)/0.025)**2)
f = f-d1-d2+recovery
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF047 — TreeRing")
plt.tight_layout(); plt.savefig("TF047_TreeRing.png",dpi=300)
~~~
