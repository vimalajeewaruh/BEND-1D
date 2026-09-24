# TF223 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=0.16+2.2*(x-0.5)**2+0.025*np.sin(2*np.pi*45*x)*(1+2.5*np.abs(x-0.5))
for c,a,w in zip([0.08,0.32,0.71,0.93],[0.18,0.10,0.12,0.20],[0.008,0.006,0.007,0.006]): f+=a*G(x,c,w)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF223 — IntradayVolatilityU")
plt.show()
~~~
