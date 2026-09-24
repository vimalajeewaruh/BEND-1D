# TF216 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
f=0.62*(S(x,0.08,0.008)-S(x,0.22,0.008))-0.58*(S(x,0.68,0.008)-S(x,0.80,0.008))
u=np.maximum(x-0.80,0); f+=(x>=0.80)*0.18*np.exp(-22*u)*np.sin(2*np.pi*30*u)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF216 — ElevatorRide")
plt.show()
~~~
