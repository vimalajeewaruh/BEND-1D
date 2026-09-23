# TF176 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 4096
x = np.linspace(0.0, 1.0, N)
indices = np.array([512, 1409, 2306, 3203])  # one-based indices
centers = (indices - 1) / (N - 1)
f = np.zeros_like(x)
for center in centers:
    u = x-center
    f += np.exp(-0.5*(u/0.014)**2)*np.cos(2*np.pi*34*u)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF176 — Dyadic Phase Twins")
plt.grid(True); plt.show()
~~~
