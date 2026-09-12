# TF003 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
b = np.array([0, 0.16, 0.34, 0.52, 0.73, 1.0])
h = np.array([0.80, 1.15, 0.75, 1.35, 0.95])
f = np.zeros_like(x)

for k in range(len(h)):
    idx = (x >= b[k]) & (x < b[k+1])
    f[idx] = h[k]*(x[idx]-b[k])/(b[k+1]-b[k])
f[-1] = 0.0

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF003 — StickSlip")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF003_StickSlip.png", dpi=300)
~~~
