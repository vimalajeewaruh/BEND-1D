# TF187 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
phi=2*np.pi*12*x+0.75*np.pi*(x>=0.28)-1.05*np.pi*(x>=0.53)+0.60*np.pi*(x>=0.78)
f=0.75*np.sin(phi)+0.12*np.sin(2*phi+0.4)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF187 — JosephsonPhaseSlips")
plt.show()
~~~
