# TF011 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
r = 0.35 + 2*x
De, a, re = 1.0, 2.8, 0.80
f = De*(1-np.exp(-a*(r-re)))**2-De

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF011 — Morse")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF011_Morse.png", dpi=300)
~~~
