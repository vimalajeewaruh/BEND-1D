# TF224 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w)); G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=0.95-0.38*x-0.34*S(x,0.61,0.008); u=np.maximum(x-0.61,0)
f+=(x>=0.61)*0.27*(1-np.exp(-u/0.18))+0.07*G(x,0.595,0.010)-0.10*G(x,0.625,0.012)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF224 — LiquidityDrought")
plt.show()
~~~
