# TF212 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
u=np.maximum(x-0.045,0); gate=S(x,0.045,0.002)
f=gate*(0.72*np.exp(-1.8*u)*np.sin(2*np.pi*6.5*u)+0.32*np.exp(-5.5*u)*np.sin(2*np.pi*13*u+0.2)+0.22*np.exp(-8.0*u)*np.sin(2*np.pi*19.5*u+0.5)+0.12*np.exp(-11*u)*np.sin(2*np.pi*32.5*u))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF212 — GuitarPluckDualDecay")
plt.show()
~~~
