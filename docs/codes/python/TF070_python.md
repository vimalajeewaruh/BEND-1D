# TF070 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
step = lambda c,w: 1/(1+np.exp(-(x-c)/w))
f = 0.48+0.10*x+0.025*np.sin(2*np.pi*3*x)
f += 0.30*step(0.18,0.004)-0.40*step(0.39,0.005)
f += 0.26*step(0.64,0.0045)-0.20*step(0.82,0.004)
thin = 0.24*(step(0.515,0.0028)-step(0.548,0.0028))
f += thin+0.020*np.sin(2*np.pi*17*x)*((x>0.18)&(x<0.82))
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Log response"); plt.title("TF070 — WellLog")
plt.tight_layout(); plt.savefig("TF070_WellLog.png",dpi=300)
~~~
