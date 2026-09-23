# TF170 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
mu = 7.0
dt = 20.0 / (N - 1)
y = np.zeros((N, 2))
y[0] = [2.0, 0.0]

def rhs(state):
    y1, y2 = state
    return np.array([y2, mu * (1.0 - y1**2) * y2 - y1])

for k in range(N - 1):
    k1 = rhs(y[k])
    k2 = rhs(y[k] + 0.5 * dt * k1)
    k3 = rhs(y[k] + 0.5 * dt * k2)
    k4 = rhs(y[k] + dt * k3)
    y[k + 1] = y[k] + dt * (k1 + 2*k2 + 2*k3 + k4) / 6.0
f = y[:, 0] / np.max(np.abs(y[:, 0]))

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF170 — Van der Pol Relaxation")
plt.grid(True); plt.show()
~~~
