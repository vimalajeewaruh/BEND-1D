# TF227 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
u=x-0.52; au=np.abs(u)
f=au**0.5+0.48*au**(1/3)*np.sin(0.18/(au+0.004))
f-=np.mean(f); f/=np.max(np.abs(f))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF227 — ChirpCuspCollision")
plt.show()
~~~
