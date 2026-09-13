# TF046 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
wear1 = 1-0.38*x**0.82
maintenance = 0.20/(1+np.exp(-160*(x-0.56)))
wear2 = -0.28*np.maximum(x-0.56,0)
micro = 0.018*np.sin(2*np.pi*12*x)*(1-0.4*x)
f = wear1+maintenance+wear2+micro
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF046 — PlateWear")
plt.tight_layout(); plt.savefig("TF046_PlateWear.png",dpi=300)
~~~
