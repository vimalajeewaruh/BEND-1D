# TF213 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=np.exp(-2.3*x)*(np.sin(2*np.pi*11*x)+0.92*np.sin(2*np.pi*11.75*x+0.12))
f+=0.35*np.exp(-6.9*x)*np.sin(2*np.pi*27.3*x+0.5)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF213 — BellBeating")
plt.show()
~~~
