# TF229 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
g1=1.10*G(x,0.50,0.18)+0.22*np.sin(2*np.pi*2*x)
g2=1.004*g1+0.018*G(x,0.44,0.10)
needle=G(x,0.635,0.006)-0.62*G(x,0.648,0.009)
f=g1-0.995*g2+0.16*needle; f/=np.max(np.abs(f))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF229 — CancellationNeedle")
plt.show()
~~~
