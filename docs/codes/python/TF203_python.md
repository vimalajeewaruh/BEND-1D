# TF203 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
u=np.maximum(x-0.25,0)
resp=(x>=0.25)*(1-np.exp(-u/0.014))*np.exp(-u/0.22)
f=1-0.72*resp+0.10*G(x,0.68,0.07)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF203 — PupilLightReflex")
plt.show()
~~~
