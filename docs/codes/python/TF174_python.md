# TF174 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
f = np.zeros_like(x)
m1 = x < 0.42
m2 = (x >= 0.42) & (x < 0.70)
m3 = x >= 0.70
u = x[m1]/0.42
f[m1] = 0.06 + 0.56*u**2 + 0.12*u**5
f[m2] = 0.98 + 0.025*np.sin(2*np.pi*2*(x[m2]-0.42)/0.28)
u = x[m3]-0.70
f[m3] = 0.24*(1-(x[m3]-0.70)/0.30) + 0.05
f[m3] += 0.15*np.exp(-16*u)*np.sin(2*np.pi*34*u)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF174 — MEMS Pull-In / Release")
plt.grid(True); plt.show()
~~~
