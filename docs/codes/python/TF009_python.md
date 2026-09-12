# TF009 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
V0, a = 1.0, 7.0
E = 0.15 + 1.70*x
T = np.zeros_like(E)

below = E < V0-1e-12
above = E > V0+1e-12
at_barrier = ~(below | above)

z = V0-E[below]
T[below] = 1/(1 + V0**2*np.sinh(a*np.sqrt(z))**2/(4*E[below]*z))

z = E[above]-V0
T[above] = 1/(1 + V0**2*np.sin(a*np.sqrt(z))**2/(4*E[above]*z))

T[at_barrier] = 1/(1+V0*a**2/4)
f = T

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("T(E(x))")
plt.title("TF009 — QuantumBarrier")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF009_QuantumBarrier.png", dpi=300)
~~~
