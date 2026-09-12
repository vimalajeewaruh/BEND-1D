# TF024 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
t = np.array([0.10, 0.24, 0.39, 0.44, 0.67, 0.83])
A = np.array([0.70, 1.00, 0.55, 0.85, 1.15, 0.65])
tau = np.array([0.035, 0.050, 0.028, 0.042, 0.060, 0.032])

f = np.zeros_like(x)
for tk, Ak, tauk in zip(t, A, tau):
    u = (x-tk)/tauk
    f += Ak*u*np.exp(1-u)*(u >= 0)

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF024 — MuscleTwitch")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF024_MuscleTwitch.png", dpi=300)
~~~
