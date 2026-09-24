# TF209 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
f=0.12+0.78*(S(x,0.08,0.025)-S(x,0.38,0.050))
f+=0.72*(S(x,0.57,0.022)-S(x,0.88,0.060))+0.025*np.sin(2*np.pi*5*x)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF209 — LeafNyctinasty")
plt.show()
~~~
