# TF193 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=0.65+0.08*np.sin(2*np.pi*1.5*x)+0.035*np.sin(2*np.pi*16*x+0.4)
for c,a,w in zip([0.23,0.51,0.73,0.86],[0.42,0.56,0.34,0.46],[0.018,0.011,0.026,0.014]): f-=a*G(x,c,w)
f+=0.06*np.sin(2*np.pi*33*x)*G(x,0.52,0.08)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF193 — GNSSMultipathFade")
plt.show()
~~~
