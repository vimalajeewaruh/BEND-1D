# TF165 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
phases = np.array([0.2, 1.1, 2.0, 0.7, 2.7, 1.6, 0.4, 2.3, 1.3])
f = np.zeros_like(x)
for m, phase in enumerate(phases):
    frequency = 2 ** m
    amplitude = 0.13 * 2 ** (-m / 3)
    f += amplitude * np.sin(2 * np.pi * frequency * x + phase)
f += 0.20 * np.exp(-0.5 * ((x - 0.24) / 0.055) ** 2) * np.sin(2 * np.pi * 73 * x + 0.3)
f += 0.16 * np.exp(-0.5 * ((x - 0.56) / 0.040) ** 2) * np.sin(2 * np.pi * 119 * x + 1.1)
f += 0.13 * np.exp(-0.5 * ((x - 0.81) / 0.028) ** 2) * np.sin(2 * np.pi * 181 * x + 0.8)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF165 — Turbulence Intermittency")
plt.grid(True); plt.show()
~~~
