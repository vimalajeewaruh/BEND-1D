# TF162 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
f = 0.12 * np.exp(-15.0 * x) + 0.88 * np.exp(-2.15 * x)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF162 — Diffusion MRI IVIM")
plt.grid(True); plt.show()
~~~
