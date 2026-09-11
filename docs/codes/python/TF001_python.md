~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
pc, beta = 0.38, 0.41
f = np.maximum(x-pc, 0)**beta

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF001 — Percolation")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF001_Percolation.png", dpi=300)
~~~
