# TF002 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
lam = 0.08 + 0.92*x
f = lam**(-5) / np.expm1(2.5/lam)

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF002 — Planck")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF002_Planck.png", dpi=300)
~~~
