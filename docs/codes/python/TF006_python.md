# TF006 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
q = 1.5
epsilon = (x-0.58)/0.025
background = 0.35*np.exp(-((x-0.26)/0.12)**2)
resonance = 0.75*((q+epsilon)**2/(1+epsilon**2)-1)
f = background + resonance

plt.plot(x, f, linewidth=1.5)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF006 — Fano")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF006_Fano.png", dpi=300)
~~~
