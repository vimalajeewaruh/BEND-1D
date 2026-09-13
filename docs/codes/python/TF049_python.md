# TF049 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 0.01*np.sin(2*np.pi*4*x)
wP = np.exp(-0.5*((x-0.25)/0.028)**2)
P = 0.42*wP*np.sin(2*np.pi*(38*x+24*x**2))
wS = np.exp(-0.5*((x-0.43)/0.055)**2)
S = wS*(np.sin(2*np.pi*24*x)+0.28*np.sin(2*np.pi*51*x+0.5))
u = np.maximum(x-0.47,0)
C = (x>=0.47)*0.40*np.exp(-4.8*u)*(np.sin(2*np.pi*31*u)+0.35*np.sin(2*np.pi*59*u+0.6))
f = f+P+S+C
plt.plot(x,f,linewidth=1.1); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF049 — Seismogram")
plt.tight_layout(); plt.savefig("TF049_Seismogram.png",dpi=300)
~~~
