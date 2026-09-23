# TF173 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0.0, 1.0, N)
f = (0.35 + 1.05*np.exp(-5*x))*np.sin(2*np.pi*8*x)
f += 0.48*np.exp(-4*x)
f += 0.26*np.exp(-5.5*x)*np.sin(2*np.pi*16*x+0.45)

plt.plot(x, f)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF173 — Transformer Inrush")
plt.grid(True); plt.show()
~~~
