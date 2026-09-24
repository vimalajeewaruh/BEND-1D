# TF189 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
sech2=lambda z: 1/np.cosh(z)**2
f=0.66*sech2((x-0.40)/0.045)+0.66*sech2((x-0.60)/0.045)
f+=0.82*sech2((x-0.50)/0.030)*np.cos(2*np.pi*29*(x-0.50))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF189 — SolitonCollision")
plt.show()
~~~
