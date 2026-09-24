# TF210 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
f=0.06+0.12*x+0.19*S(x,0.19,0.035)+0.15*S(x,0.39,0.018)
f+=0.27*S(x,0.63,0.050)+0.12*S(x,0.84,0.020)
f+=0.018*np.sin(2*np.pi*9*x)*(S(x,0.17,0.03)-S(x,0.88,0.03))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF210 — FungalGrowthPulse")
plt.show()
~~~
