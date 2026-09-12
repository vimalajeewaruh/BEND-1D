# TF016 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.72
f = np.zeros_like(x)

before = x < xc
z = xc-x[before]
f[before] = 1.50-0.80*z**0.42*(1+0.12*np.cos(9*np.log(z)))

after = x >= xc
f[after] = 0.92+0.42*(1-np.exp(-8*(x[after]-xc)))

plt.plot(x, f, linewidth=1.3)
plt.axvline(xc, color="red", linestyle="--", label="Crash time")
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF016 — MarketCrash")
plt.grid(alpha=0.3)
plt.legend()
plt.tight_layout()
plt.savefig("TF016_MarketCrash.png", dpi=300)
~~~
