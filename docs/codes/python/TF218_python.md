# TF218 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
u=np.maximum(x-0.12,0); main=(x>=0.12)*(u/0.16)**2*np.exp(2-u/0.16); main/=np.max(main)
f=0.12+0.82*main+0.16*G(x,0.43,0.025)+0.12*G(x,0.58,0.032)-0.07*G(x,0.71,0.018)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF218 — AtmosphericRiver")
plt.show()
~~~
