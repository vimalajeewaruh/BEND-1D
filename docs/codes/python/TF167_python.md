# TF167 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
S = lambda z, c, w: 1.0 / (1.0 + np.exp(-(z - c) / w))
f = np.zeros_like(x)
loading = x <= 0.70
f[loading] = 1.08 * (x[loading] / 0.70) ** 1.50
f[loading] -= 0.055 * S(x[loading], 0.29, 0.0018)
f[loading] -= 0.070 * S(x[loading], 0.47, 0.0018)
i70 = np.argmin(np.abs(x - 0.70))
f70 = f[i70]
unloading = x > 0.70
f[unloading] = f70 * ((1.0 - x[unloading]) / 0.30) ** 1.32
f -= 0.11 * np.exp(-0.5 * ((x - 0.925) / 0.018) ** 2)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF167 — Nanoindentation Pop-In")
plt.grid(True); plt.show()
~~~
