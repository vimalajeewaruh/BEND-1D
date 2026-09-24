# TF186 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
vis=(0.92-0.35*x)*(1-0.78*G(x,0.56,0.055))
phase=2*np.pi*(8*x+2.8*x**2)+0.55*np.sin(2*np.pi*1.4*x)
f=vis*np.cos(phase)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF186 — QubitRamseyWander")
plt.show()
~~~
