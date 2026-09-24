# TF200 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
thermal=0.12+0.78*(1-np.exp(-4*x)); gate=S(x,0.44,0.01)
sq=0.5*(1+np.sign(np.sin(2*np.pi*12*(x-0.44))))
f=thermal-0.16*gate*sq+0.045*gate*np.sin(2*np.pi*24*(x-0.44))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF200 — ThermalThrottle")
plt.show()
~~~
