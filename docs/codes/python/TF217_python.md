# TF217 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w)); f=0.25+0.18*x
for on,off,a in zip([0.05,0.28,0.52,0.76],[0.18,0.41,0.65,0.89],[0.22,0.20,0.23,0.19]): f+=a*(S(x,on,0.018)-S(x,off,0.038))
f+=0.025*np.sin(2*np.pi*4*x)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF217 — ThermostatCycle")
plt.show()
~~~
