# TF051 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
sea = (0.48+0.15*np.sin(2*np.pi*0.8*x))*(np.sin(2*np.pi*9*x)+0.20*np.sin(2*np.pi*18*x+0.5))
rogue = 1.55*np.exp(-0.5*((x-0.61)/0.030)**2)*np.sin(2*np.pi*9*(x-0.61)+np.pi/2)
f = sea+rogue
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF051 — RogueWave")
plt.tight_layout(); plt.savefig("TF051_RogueWave.png",dpi=300)
~~~
