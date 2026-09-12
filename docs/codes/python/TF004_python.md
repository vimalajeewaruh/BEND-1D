# TF004 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
x0 = 0.28
f = np.zeros_like(x)
idx = x >= x0
u = x[idx] - x0
f[idx] = np.exp(-7*u)*np.sin(32*np.pi*u)

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF004 — RingDown")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF004_RingDown.png", dpi=300)
~~~
