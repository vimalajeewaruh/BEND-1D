# TF161 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
S = lambda z, c, w: 1.0 / (1.0 + np.exp(-(z - c) / w))

f = np.zeros_like(x)
starts = np.array([0.010, 0.205, 0.400, 0.595, 0.790])
for k, start in enumerate(starts, start=1):
    rise, fall = start + 0.045, start + 0.145
    gate = S(x, rise, 0.0035) - S(x, fall, 0.0035)
    slope = 0.80 + 0.12 * (x - rise) / (fall - rise)
    if k == 4:
        slope = 0.70 + 0.34 * (x - rise) / (fall - rise)
    f += gate * slope
f -= 0.12 * np.exp(-0.5 * ((x - 0.685) / 0.009) ** 2)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF161 — Capnogram Breaths")
plt.grid(True); plt.show()
~~~
