# TF191 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
kappa=26; x0=0.64
sp=np.log1p(np.exp(kappa*(x-x0)))/kappa
sp1=np.log1p(np.exp(kappa*(1-x0)))/kappa
f=1-0.18*x-0.58*(sp/sp1)**1.55
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF191 — BatteryKnee")
plt.show()
~~~
