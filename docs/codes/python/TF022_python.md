# TF022 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)

f = (0.08*np.log(1 + 20*x)
     + 0.55*np.tanh((x-0.31)/0.018)
     + 0.32*np.tanh((x-0.69)/0.060)
     + 0.13*np.tanh((x-0.84)/0.014)
     + 0.07*np.exp(-((x-0.50)/0.028)**2))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF022 — Titration")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF022_Titration.png", dpi=300)
~~~
