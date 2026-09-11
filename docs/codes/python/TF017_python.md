~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.48
u = x - xc

s = 4 * np.arctan(np.exp(12 * u)) - np.pi
f = (s + 0.18 * np.exp(-2.2 * x) * np.sin(8 * np.pi * x)
     + 0.10 * (x >= xc) * np.exp(-8 * u) * np.sin(36 * np.pi * u))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF017 — Klatno")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF017_Klatno.png", dpi=300)
~~~
