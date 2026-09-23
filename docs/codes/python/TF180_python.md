# TF180 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
centers = np.array([0.10, 0.29, 0.49, 0.69, 0.89])
alpha = np.array([0.25, 0.50, 1.00, 1.50, 2.50])
w = 0.040
f = np.zeros_like(x)
for center, exponent in zip(centers, alpha):
    z = (x-center)/w
    phi = np.exp(-0.5*z**2)*(1-0.62*np.abs(z)**exponent)
    phi /= np.max(np.abs(phi))
    f += 0.42*phi

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF180 — Hölder Ladder")
plt.grid(True); plt.show()
~~~
