# TF164 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
r = np.array([0.110, 0.305, 0.500, 0.695, 0.890])
t_amp = np.array([0.300, 0.270, 0.300, 0.270, 0.300])
f = np.zeros_like(x)
for rc, ta in zip(r, t_amp):
    f += 0.12 * np.exp(-0.5 * ((x - (rc - 0.060)) / 0.018) ** 2)
    f -= 0.14 * np.exp(-0.5 * ((x - (rc - 0.012)) / 0.0050) ** 2)
    f += np.exp(-0.5 * ((x - rc) / 0.0042) ** 2)
    f -= 0.25 * np.exp(-0.5 * ((x - (rc + 0.012)) / 0.0060) ** 2)
    f += ta * np.exp(-0.5 * ((x - (rc + 0.070)) / 0.027) ** 2)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF164 — T-Wave Alternans")
plt.grid(True); plt.show()
~~~
