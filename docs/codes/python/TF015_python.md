# TF015 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
f = -np.sqrt(x*(1-x))*np.log(np.sqrt((x-0.57)**2+0.006**2))

plt.plot(x, f, linewidth=1.5)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF015 — VanHove")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF015_VanHove.png", dpi=300)
~~~
