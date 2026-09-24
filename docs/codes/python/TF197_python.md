# TF197 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=np.exp(-2.4*x)*(np.sin(2*np.pi*15*x)+0.93*np.sin(2*np.pi*16.4*x+0.15))
f+=0.28*np.exp(-5.8*x)*np.sin(2*np.pi*33*x+0.6)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF197 — ModeBeatingDecay")
plt.show()
~~~
