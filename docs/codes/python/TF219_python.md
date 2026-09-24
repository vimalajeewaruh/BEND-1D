# TF219 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
f=0.18+0.72*S(x,0.28,0.075)-0.82*S(x,0.79,0.012)
f+=(0.02+0.05*S(x,0.35,0.08))*np.sin(2*np.pi*9*x)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF219 — HeatwaveFrontBreak")
plt.show()
~~~
