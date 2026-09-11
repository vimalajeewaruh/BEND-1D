~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
f = np.exp(-0.9*x) * np.sin(2*np.pi*(3*x + 7*x**2))**2

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF023 — RabiChirp")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF023_RabiChirp.png", dpi=300)
~~~
