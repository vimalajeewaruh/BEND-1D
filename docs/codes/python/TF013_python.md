# TF013 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
depolarization = 1.20/(1+np.exp(-180*(x-0.23)))
repolarization = 1.05/(1+np.exp(-55*(x-0.53)))
undershoot = 0.22*np.exp(-((x-0.67)/0.065)**2)
f = depolarization-repolarization-undershoot

plt.plot(x, f, linewidth=1.5)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF013 — ActionPotential")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF013_ActionPotential.png", dpi=300)
~~~
