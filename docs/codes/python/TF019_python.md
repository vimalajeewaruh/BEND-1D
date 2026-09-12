# TF019 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.30
u = x - xc

f = (0.65 * (1 + np.tanh(120*u))
     + 0.38 * (x >= xc) * np.exp(-6*u) * np.cos(54*np.pi*u))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF019 — WaterHammer")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF019_WaterHammer.png", dpi=300)
~~~
