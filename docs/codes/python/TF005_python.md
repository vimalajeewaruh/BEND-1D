~~~python
import numpy as np
import matplotlib.pyplot as plt
from scipy.special import erf

N = 1024
x = np.linspace(0, 1, N)
f = 0.5*(erf((x-0.28)/0.025) - erf((x-0.72)/0.070))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF005 — DiffusionBand")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF005_DiffusionBand.png", dpi=300)
~~~

