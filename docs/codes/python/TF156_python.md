# TF156 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=np.zeros_like(x)
f[x<.18]=1.00
m=(x>=.18)&(x<.40); f[m]=1-.38*(x[m]-.18)/(.40-.18)
f[(x>=.40)&(x<.58)]=.62; f[(x>=.58)&(x<.76)]=.40; f[x>=.76]=.08
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF156_RiemannShockFan.png',dpi=300)
~~~
