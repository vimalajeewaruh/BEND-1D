# TF225 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=0.18+0.10*x
for c,a,t1,t2 in zip([0.43,0.76],[0.72,-0.32],[0.055,0.040],[0.24,0.14]):
    u=np.maximum(x-c,0); f+=(x>=c)*a*(0.72*np.exp(-u/t1)+0.28*np.exp(-u/t2))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF225 — YieldShockRecovery")
plt.show()
~~~
