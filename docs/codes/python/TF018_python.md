# TF018 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
b1, b3, xc = 1.8751040687, 7.8547574382, 0.63

def mode_shape(beta):
    c = (np.cosh(beta) + np.cos(beta)) / (np.sinh(beta) + np.sin(beta))
    phi = (np.cosh(beta*x) - np.cos(beta*x)
           - c * (np.sinh(beta*x) - np.sin(beta*x)))
    return phi / np.max(np.abs(phi))

phi1 = mode_shape(b1)
phi3 = mode_shape(b3)
h = np.maximum(x-xc, 0) - (1-xc)*x
f = phi1 + 0.18*phi3 + 0.12*h

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF018 — Cantilever")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF018_Cantilever.png", dpi=300)
~~~
