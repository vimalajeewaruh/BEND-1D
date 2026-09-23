# TF179 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
centers = np.array([0.10, 0.27, 0.45, 0.65, 0.85])
widths = np.array([0.005, 0.008, 0.013, 0.022, 0.037])
wref = 0.013
f = np.zeros_like(x)
for center, width in zip(centers, widths):
    z = (x-center)/width
    amplitude = np.sqrt(wref/width)
    f += amplitude*(1-z**2)*np.exp(-0.5*z**2)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF179 — Equal-Energy Scale Ladder")
plt.grid(True); plt.show()
~~~
