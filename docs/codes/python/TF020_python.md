~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.68
Aq, wq = 0.20, 0.035  # implementation convention

fc = -np.log(1 - xc/(xc + 0.035)) + 0.12*np.sin(20*np.pi*xc)

u = x - xc
continuity = Aq*np.exp(-((xc-0.80)/wq)**2) * np.exp(-11*u)
fpost = fc*np.exp(-11*u) - Aq*np.exp(-((x-0.80)/wq)**2) + continuity
f = np.empty_like(x)
pre = x < xc
bpre = -np.log(1 - x[pre]/(xc + 0.035))
f[pre] = bpre + 0.12*(x[pre]/xc)**3 * np.sin(20*np.pi*x[pre])
f[~pre] = fpost[~pre]

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF020 — ThermalRunaway")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF020_ThermalRunaway.png", dpi=300)
~~~
