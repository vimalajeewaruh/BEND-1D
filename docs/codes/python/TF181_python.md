# TF181 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
xc=0.72; pre=x<xc
A=0.12+0.88*(x/xc)**1.6
phase=2*np.pi*(4*x+5*x**2+12*x**3+18*x**5)
phasec=2*np.pi*(4*xc+5*xc**2+12*xc**3+18*xc**5)
f=np.zeros_like(x); f[pre]=A[pre]*np.sin(phase[pre])
u=np.maximum(x-xc,0)
f[~pre]=np.exp(-14*u[~pre])*np.sin(2*np.pi*42*u[~pre]+phasec)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF181 — GWChirpRingdown")
plt.show()
~~~
