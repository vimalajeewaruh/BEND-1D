# TF226 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
raw=1/((x-0.52)**2+0.015**2); f=raw/np.max(raw)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF226 — AnalyticNearPole")
plt.show()
~~~
