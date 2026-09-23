# TF171 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
f = 0.015 * np.sin(2*np.pi*3*x)
f += 0.10 * np.exp(-0.5*((x-0.24)/0.025)**2) * np.sin(2*np.pi*42*x)
u = np.maximum(x-0.39, 0.0)
env = (x >= 0.39) * np.exp(-0.5*((x-0.64)/0.16)**2)
f += 0.48 * env * np.sin(2*np.pi*(34*u-10*u**2))
u_coda = np.maximum(x-0.72, 0.0)
f += (x >= 0.72) * 0.10 * np.exp(-9*u_coda) * np.sin(2*np.pi*48*u_coda)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF171 — Seismic Dispersive Wave")
plt.grid(True); plt.show()
~~~
