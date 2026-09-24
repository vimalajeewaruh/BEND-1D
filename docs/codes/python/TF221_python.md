# TF221 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
amp=0.45+0.20*np.sin(2*np.pi*0.75*x+0.4); phase=2*np.pi*(2.1*x+0.22*x**2)
f=amp*np.sin(phase)+0.22*G(x,0.28,0.06)-0.18*G(x,0.57,0.07)+0.25*G(x,0.83,0.045)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF221 — ENSOEnvelope")
plt.show()
~~~
