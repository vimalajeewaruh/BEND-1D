# TF188 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
q=6.4*x+0.07*np.sin(2*np.pi*x); ramp=q-np.floor(q)
f=0.12+0.78*ramp*(1+0.10*np.sin(2*np.pi*1.1*x))
for ck,ak in zip([0.156,0.312,0.468,0.625,0.782,0.937],[0.12,0.08,0.15,0.10,0.16,0.08]): f+=ak*G(x,ck,0.006)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF188 — TokamakELMTrain")
plt.show()
~~~
