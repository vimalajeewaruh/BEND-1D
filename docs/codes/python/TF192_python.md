# TF192 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=0.82+0.03*np.sin(2*np.pi*2*x)
for c,a,tf,ts in zip([0.20,0.50,0.76],[0.36,0.48,0.32],[0.010,0.012,0.008],[0.095,0.135,0.080]):
    u=np.maximum(x-c,0)
    f-=(x>=c)*a*(1-np.exp(-u/tf))*np.exp(-u/ts)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF192 — FuelCellFloodDry")
plt.show()
~~~
