# TF163 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
mu = np.array([0.18, 0.27, 0.36, 0.47, 0.58, 0.69, 0.79])
a = np.array([0.18, 0.15, 0.24, 0.19, 0.31, 0.13, 0.10])
w = np.array([0.010, 0.012, 0.011, 0.013, 0.014, 0.015, 0.016])
f = np.zeros_like(x)
for center, amp, width in zip(mu, a, w):
    f += amp * np.exp(-0.5 * ((x - center) / width) ** 2)
    f -= 0.52 * amp * np.exp(-0.5 * ((x - (center - 0.020)) / (1.15 * width)) ** 2)
f += 0.03 * np.exp(-0.5 * ((x - 0.10) / 0.006) ** 2)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF163 — Auditory Brainstem Response")
plt.grid(True); plt.show()
~~~
