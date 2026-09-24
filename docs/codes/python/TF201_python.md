# TF201 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=0.20+0.03*np.sin(2*np.pi*x)
for c,a,tau in zip([0.16,0.36,0.54,0.69],[0.48,0.62,0.45,0.70],[0.075,0.095,0.080,0.110]):
    u=np.maximum(x-c,0); resp=(x>=c)*(u/tau)*np.exp(1-u/tau)
    f+=a*resp
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF201 — CGMMealStack")
plt.show()
~~~
