# TF215 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=0.72+0.05*np.sin(2*np.pi*0.8*x)
for c,a,tf,ts in zip([0.18,0.38,0.59,0.78],[0.48,0.38,0.55,0.44],[0.015,0.020,0.012,0.018],[0.08,0.11,0.09,0.10]):
    u=np.maximum(x-c,0); f-=(x>=c)*a*(1-np.exp(-u/tf))*np.exp(-u/ts)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF215 — TrafficStopGo")
plt.show()
~~~
