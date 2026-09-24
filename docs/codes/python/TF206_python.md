# TF206 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=0.08+0.28*(1-np.exp(-(x/0.012)**1.25))
f+=0.25*(1-np.exp(-(x/0.075)**1.15))+0.38*(1-np.exp(-(x/0.32)**1.55))
f+=0.035*G(x,0.085,0.018)-0.025*G(x,0.20,0.032)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF206 — OJIPFluorescence")
plt.show()
~~~
