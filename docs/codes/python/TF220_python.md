# TF220 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
f=1-0.62*x**1.35+0.37*S(x,0.78,0.018)-0.08*S(x,0.92,0.03)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF220 — DroughtRecovery")
plt.show()
~~~
