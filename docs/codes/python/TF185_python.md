# TF185 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
amp=0.45+0.35*S(x,0.18,0.06)-0.22*S(x,0.78,0.05)
phase=2*np.pi*(10*x+8*x**2+1.8*x**3)+0.7*np.sin(2*np.pi*1.3*x)
f=amp*np.sin(phase)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF185 — XrayQPODrift")
plt.show()
~~~
