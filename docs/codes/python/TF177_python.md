# TF177 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
f = np.zeros_like(x)
for center in [0.025, 0.500, 0.975]:
    u = x-center
    f += np.exp(-0.5*(u/0.013)**2)*np.cos(2*np.pi*31*u)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF177 — Boundary / Interior Twins")
plt.grid(True); plt.show()
~~~
