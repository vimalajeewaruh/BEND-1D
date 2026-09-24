# TF196 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
G=lambda z,c,w: np.exp(-0.5*((z-c)/w)**2)
f=np.zeros_like(x)
for c,a,w,fr in zip([0.18,0.225,0.46,0.69,0.735,0.84],[0.70,0.42,0.95,0.52,0.76,0.38],[0.003,0.0025,0.0035,0.0025,0.003,0.002],[70,86,62,92,78,105]):
    f+=a*G(x,c,w); u=np.maximum(x-c,0)
    f+=(x>=c)*(0.18*a)*np.exp(-35*u)*np.sin(2*np.pi*fr*u)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF196 — CavitationCollapse")
plt.show()
~~~
