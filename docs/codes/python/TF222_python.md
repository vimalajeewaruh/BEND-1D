# TF222 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
xc=0.83; f=np.zeros_like(x); pre=x<xc; t=np.maximum(xc-x,1e-5)
f[pre]=1-1.05*t[pre]**0.55*(1+0.14*np.cos(8.5*np.log(t[pre])+0.4))
u=np.maximum(x-xc,0)
f[~pre]=0.24+0.42*(1-np.exp(-u[~pre]/0.12))+0.03*np.sin(2*np.pi*18*u[~pre])*np.exp(-12*u[~pre])
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF222 — BubbleLogPeriodic")
plt.show()
~~~
