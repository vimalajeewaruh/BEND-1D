# TF067 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
bleach = 0.72*np.exp(-3.8*x)+0.30*np.exp(-0.62*x)+0.035
recovery = 0.070*np.exp(-0.5*((x-0.56)/0.045)**2)
small_step = 0.030/(1+np.exp(-75*(x-0.73)))
f = bleach+recovery+small_step
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Intensity"); plt.title("TF067 — FluorescenceBleach")
plt.tight_layout(); plt.savefig("TF067_FluorescenceBleach.png",dpi=300)
~~~
