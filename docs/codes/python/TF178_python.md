# TF178 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
centers = np.array([0.10, 0.25, 0.40, 0.55, 0.70, 0.85])
separation = np.array([0.060, 0.045, 0.032, 0.024, 0.018, 0.012])
w = 0.010
f = np.zeros_like(x)
for center, distance in zip(centers, separation):
    f += np.exp(-0.5*((x-(center-distance/2))/w)**2)
    f += np.exp(-0.5*((x-(center+distance/2))/w)**2)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF178 — Rayleigh Doublet Ladder")
plt.grid(True); plt.show()
~~~
