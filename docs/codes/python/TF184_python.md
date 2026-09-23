# TF184 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=0.025*np.sin(2*np.pi*3*x)
c=[0.16,0.28,0.295,0.48,0.67,0.715,0.83]
a=[0.55,0.42,0.25,0.92,0.38,0.62,0.30]
w=[0.008,0.006,0.0035,0.010,0.005,0.006,0.004]
for ck,ak,wk in zip(c,a,w): f+=ak*G(x,ck,wk)
for ck,ak in zip([0.48,0.715],[0.18,0.12]):
    u=np.maximum(x-ck,0)
    f+=(x>=ck)*ak*np.exp(-22*u)*np.sin(2*np.pi*55*u)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF184 — MagnetarBurstStorm")
plt.show()
~~~
