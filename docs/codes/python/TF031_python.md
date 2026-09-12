~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 0.018*np.sin(2*np.pi*5*x)
c = [0.17,0.46,0.75]; s = [0.095,0.125,0.085]; A = [0.95,1.15,0.82]
osc = (np.sin(2*np.pi*(31*x+4.5*x**2)) + 0.52*np.sin(2*np.pi*53*x+0.7)
       + 0.23*np.sin(2*np.pi*79*x-0.4))
for ck,sk,ak in zip(c,s,A):
    w = np.exp(-((x-ck)/sk)**2)
    f += ak*w*osc
plt.plot(x,f,linewidth=1.2); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF031 — EEGBurstSuppress")
plt.tight_layout(); plt.savefig("TF031_EEGBurstSuppress.png",dpi=300)
~~~
