# TF007 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
e = 0.72
d, H, a = 1-e, 1.0, 0.0
f = np.zeros_like(x)

while d > 1/(10*N) and a < 1:
    idx = (x >= a) & (x <= min(a+d, 1))
    u = (x[idx]-a)/d
    f[idx] = 4*H*u*(1-u)
    a += d
    d *= e
    H *= e**2
f[-1] = 0.0

plt.plot(x, f, linewidth=1.3)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF007 — BouncingBall")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF007_BouncingBall.png", dpi=300)
~~~
