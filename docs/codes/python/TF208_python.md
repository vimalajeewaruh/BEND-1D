# TF208 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=0.12*np.ones_like(x)
for c,a,tr,td in zip([0.08,0.57],[0.78,0.70],[0.040,0.050],[0.17,0.19]):
    u=np.maximum(x-c,0); f+=(x>=c)*a*(1-np.exp(-u/tr))*np.exp(-u/td)
f+=0.03*np.sin(2*np.pi*2*x-0.4)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF208 — SapFlowLag")
plt.show()
~~~
