# TF204 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=np.zeros_like(x)
for c,a,tau,p in zip([0.28,0.405,0.53],[1.0,0.48,0.32],[0.035,0.027,0.045],[1.2,1.4,1.1]):
    u=np.maximum(x-c,0); resp=(x>=c)*(u/tau)**p*np.exp(p-u/tau)
    f+=a*resp
f*=1+0.08*np.sin(2*np.pi*23*x)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF204 — CoughFlowBurst")
plt.show()
~~~
