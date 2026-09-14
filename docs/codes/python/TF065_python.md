# TF065 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 0.018+0.025*x-0.070*np.exp(-0.5*((x-0.305)/0.014)**2)
contact = (x>=0.33)&(x<0.78); u = np.maximum(x-0.33,0)
f[contact] = (0.025+0.025*x[contact]+3.35*u[contact]**1.42
              +0.020*np.sin(2*np.pi*9*x[contact]))
post = x>=0.78
f[post] = 0.030+0.015*(x[post]-0.78)-0.115*np.exp(-24*(x[post]-0.78))
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Force"); plt.title("TF065 — AFMForceCurve")
plt.tight_layout(); plt.savefig("TF065_AFMForceCurve.png",dpi=300)
~~~
