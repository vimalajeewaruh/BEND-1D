# TF010 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
Delta = 0.035
f = np.sqrt(4*(x-0.52)**2 + Delta**2)

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF010 — AvoidedCrossing")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF010_AvoidedCrossing.png", dpi=300)
~~~
