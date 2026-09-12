~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 0.025*np.sin(2*np.pi*1.2*x)
c = [0.28,0.405,0.515,0.612,0.700]
A = [1.00,0.78,0.61,0.47,0.34]
s = [0.028,0.024,0.022,0.020,0.018]
for ck,ak,sk in zip(c,A,s):
    f -= ak/np.cosh((x-ck)/sk)**2
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF039 — InternalSolitons")
plt.tight_layout(); plt.savefig("TF039_InternalSolitons.png",dpi=300)
~~~
