# TF228 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
u=x-0.57; au=np.abs(u)
f=au**0.34*(1+0.62*np.sin(10.5*np.log(au+0.0025)))
f-=np.mean(f); f/=np.max(np.abs(f))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF228 — LogPeriodicCusp")
plt.show()
~~~
