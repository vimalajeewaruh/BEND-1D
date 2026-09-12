~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); env = np.zeros_like(x)
for a,b in [(0.00,0.26),(0.34,0.60),(0.68,0.94)]:
    ind = (x>=a)&(x<=b); u = (x[ind]-a)/(b-a)
    env[ind] = np.sin(np.pi*u)**1.65
phase = 2*np.pi*(12*x+0.55*x**2)
f = env*(np.sin(phase)+0.13*np.sin(2*phase-0.35))
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF030 — CheyneStokes")
plt.tight_layout(); plt.savefig("TF030_CheyneStokes.png",dpi=300)
~~~
