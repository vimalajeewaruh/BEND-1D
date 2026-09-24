# TF205 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=np.ones_like(x)
for c,a,tf,ts in zip([0.34,0.67],[0.54,0.34],[0.012,0.018],[0.19,0.14]):
    u=np.maximum(x-c,0)
    f-=(x>=c)*a*(1-np.exp(-u/tf))*np.exp(-u/ts)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF205 — DesaturationRecovery")
plt.show()
~~~
