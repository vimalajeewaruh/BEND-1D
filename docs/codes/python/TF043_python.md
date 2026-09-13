# TF043 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
base = 0.20+0.34*x+0.035*np.sin(2*np.pi*2.2*x)
jump = 0.18/(1+np.exp(-180*(x-0.47)))
late = -0.22*np.maximum(x-0.47,0)
run = 0.018*np.sin(2*np.pi*17*x)*(0.35+0.65*x)
f = base+jump+late+run
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF043 — StampShadeRun")
plt.tight_layout(); plt.savefig("TF043_StampShadeRun.png",dpi=300)
~~~
