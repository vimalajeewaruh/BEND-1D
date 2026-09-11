~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
rise = 1/(1+np.exp(-100*(x-0.25)))
depletion = 1/(1+np.exp(-40*(x-0.55)))
relaxation = np.zeros_like(x)
idx = x >= 0.55
u = x[idx]-0.55
relaxation[idx] = 0.20*np.exp(-9*u)*np.sin(45*np.pi*u)
f = rise-depletion+relaxation

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF012 — BZPulse")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF012_BZPulse.png", dpi=300)
~~~
