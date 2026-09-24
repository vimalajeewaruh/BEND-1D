# TF195 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=0.12+0.72*G(x,0.55,0.22)
for c,a,w in zip([0.21,0.37,0.49,0.58,0.74,0.79],[0.18,0.28,0.20,0.34,0.23,-0.15],[0.004,0.003,0.0025,0.0035,0.0028,0.004]): f+=a*G(x,c,w)
f+=0.05*np.sin(2*np.pi*18*x)*G(x,0.58,0.20)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF195 — MeltPoolSpatter")
plt.show()
~~~
