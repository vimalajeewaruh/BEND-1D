# TF060 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); u = np.maximum(x-0.07,0)
main = u**2.15*np.exp(-8.8*u); main /= main.max()
notch = -0.115*np.exp(-0.5*((x-0.50)/0.012)**2)
rebound = 0.060*np.exp(-0.5*((x-0.545)/0.021)**2)
tail = 0.065*(x>=0.53)*np.exp(-4.8*(x-0.53))
f = 0.065+0.92*main+notch+rebound+tail
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF060 — ArterialPulse")
plt.tight_layout(); plt.savefig("TF060_ArterialPulse.png",dpi=300)
~~~
