# TF034 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = np.zeros_like(x)
centers = np.arange(0.07,0.991,0.115)
G = lambda mu,s: np.exp(-0.5*((x-mu)/s)**2)
for k,c in enumerate(centers):
    a = 0.92+0.08*np.sin(2*np.pi*k/len(centers))
    f += a*(1.05*G(c,0.010)+0.48*G(c+0.022,0.020)
            -0.23*G(c+0.039,0.006)+0.20*G(c+0.056,0.016))
f += 0.08
plt.plot(x,f,linewidth=1.3); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF033 — ArterialPulse")
plt.tight_layout(); plt.savefig("TF033_ArterialPulse.png",dpi=300)
~~~
