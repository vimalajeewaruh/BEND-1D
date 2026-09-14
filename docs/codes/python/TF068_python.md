# TF068 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
G = lambda c,w: np.exp(-0.5*((x-c)/w)**2)
C = 0.30+0.10*x-0.055*x**2+0.012*np.sin(2*np.pi*1.5*x)
f = C+0.095*G(0.235,0.007)+0.24*G(0.565,0.045)
f += 0.13*G(0.745,0.010)+0.10*G(0.770,0.009)-0.075*G(0.885,0.012)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Intensity"); plt.title("TF068 — RadioAstronomyLine")
plt.tight_layout(); plt.savefig("TF068_RadioAstronomyLine.png",dpi=300)
~~~
