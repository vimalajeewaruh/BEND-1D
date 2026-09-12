# TF008 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
x0 = 0.27
u = x-x0
impact = 1.20*np.exp(-0.5*((x-x0)/0.006)**2)
mode1 = np.zeros_like(x)
mode2 = np.zeros_like(x)
idx = x >= x0
mode1[idx] = np.exp(-8*u[idx])*np.sin(34*np.pi*u[idx])
mode2[idx] = 0.28*np.exp(-11*u[idx])*np.sin(82*np.pi*u[idx])
f = impact + mode1 + mode2

plt.plot(x, f, linewidth=1.3)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF008 — ImpactSpring")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF008_ImpactSpring.png", dpi=300)
~~~
