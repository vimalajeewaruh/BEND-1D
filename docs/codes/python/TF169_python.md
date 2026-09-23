# TF169 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
S = lambda z, c, w: 1.0 / (1.0 + np.exp(-(z - c) / w))
f = 1.0
f = f - 0.18 * S(x, 0.20, 0.022)
f = f - 0.38 * S(x, 0.49, 0.030)
f = f - 0.10 * S(x, 0.61, 0.015)
f = f - 0.25 * S(x, 0.77, 0.020)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF169 — TGA Decomposition")
plt.grid(True); plt.show()
~~~
