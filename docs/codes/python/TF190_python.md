# TF190 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
f=0.10+0.04*x
for ck,ak,tk in zip([0.16,0.38,0.60],[0.35,0.33,0.30],[0.025,0.060,0.120]):
    u=np.maximum(x-ck,0); f+=(x>=ck)*ak*np.exp(-u/tk)
f=f-0.48*S(x,0.83,0.006)+0.20*S(x,0.89,0.025)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF190 — CriticalSlowing")
plt.show()
~~~
