# TF166 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
f = np.zeros_like(x)
m1 = x < 0.18
m2 = (x >= 0.18) & (x < 0.34)
m3 = (x >= 0.34) & (x < 0.72)
m4 = (x >= 0.72) & (x < 0.90)
m5 = x >= 0.90
f[m1] = 4.0 * x[m1]
f[m2] = 0.72 + 0.035 * (x[m2] - 0.18) / (0.34 - 0.18)
u = (x[m3] - 0.34) / (0.72 - 0.34)
f[m3] = 0.755 + 0.30 * u + 0.055 * u**2
u = (x[m4] - 0.72) / (0.90 - 0.72)
f[m4] = 1.11 - 0.22 * u - 0.03 * u**2
f[m5] = 0.15 + 0.04 * np.exp(-18.0 * (x[m5] - 0.90))

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF166 — Stress–Strain Fracture")
plt.grid(True); plt.show()
~~~
