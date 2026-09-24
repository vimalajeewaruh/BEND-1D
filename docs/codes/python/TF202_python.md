# TF202 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
kcomp=-0.75*G(x,0.43,0.035)+0.48*G(x,0.475,0.048)
spindle=0.32*G(x,0.66,0.075)*np.sin(2*np.pi*37*(x-0.66))
slow=0.06*np.sin(2*np.pi*2.4*x); f=slow+kcomp+spindle
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF202 — SleepSpindleKComplex")
plt.show()
~~~
