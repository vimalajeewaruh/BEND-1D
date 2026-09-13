# TF048 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
slow = 0.34*np.sin(2*np.pi*1.25*x)+0.16*np.sin(2*np.pi*3.4*x+0.7)
fine = 0.045*np.sin(2*np.pi*27*x)*(0.7+0.3*np.cos(2*np.pi*x))
event = -0.62*np.exp(-0.5*((x-0.58)/0.018)**2)
step = 0.20*(1/(1+np.exp(-85*(x-0.62)))-1/(1+np.exp(-55*(x-0.76))))
f = slow+fine+event+step
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF048 — IceCore")
plt.tight_layout(); plt.savefig("TF048_IceCore.png",dpi=300)
~~~
