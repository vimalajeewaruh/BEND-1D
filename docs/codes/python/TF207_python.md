# TF207 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w)); G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=1-0.62*S(x,0.39,0.020)+0.30*S(x,0.79,0.055)-0.06*G(x,0.50,0.055)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF207 — StomatalClosure")
plt.show()
~~~
