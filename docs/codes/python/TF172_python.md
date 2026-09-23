# TF172 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
f = np.zeros_like(x)
m1 = x < 0.30
m2 = (x >= 0.30) & (x < 0.56)
m3 = (x >= 0.56) & (x < 0.82)
m4 = x >= 0.82
f[m1] = 0.22 * (1.0 - np.exp(-10.0*x[m1]))
f[m2] = 0.209 + 0.22 * (x[m2]-0.30)
u = (x[m3]-0.56)/(0.82-0.56)
f[m3] = 0.266 + 0.10*u + 0.62*u**4
f[m4] = 0.28 + 0.18*np.exp(-10.0*(x[m4]-0.82))

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF172 — Tertiary Creep Failure")
plt.grid(True); plt.show()
~~~
