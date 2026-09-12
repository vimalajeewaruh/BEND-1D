# TF029 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = np.zeros_like(x)
centers = np.array([0.09,0.22,0.35,0.48,0.76,0.89])
amps = np.array([1.00,0.98,1.03,1.00,0.97,1.02])
G = lambda mu,s: np.exp(-0.5*((x-mu)/s)**2)
for c,a in zip(centers,amps):
    f += a*(0.12*G(c-0.036,0.012)-0.14*G(c-0.008,0.0045)
            +G(c,0.0055)-0.26*G(c+0.010,0.0060)+0.30*G(c+0.042,0.018))
cp = 0.595
f += 1.05*G(cp-0.006,0.012)-0.72*G(cp+0.011,0.015)+0.42*G(cp+0.045,0.028)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF029 — PVCTrain")
plt.tight_layout(); plt.savefig("TF029_PVCTrain.png",dpi=300)
~~~
