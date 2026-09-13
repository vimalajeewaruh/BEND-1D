# TF056 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
season = 0.30+0.10*np.sin(2*np.pi*4*x-0.8)
outbreak = 0.95*np.exp(-0.5*((x-0.54)/0.060)**2)
intervention = -0.18/(1+np.exp(-70*(x-0.63)))
f = season+outbreak+intervention
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF056 — EpidemicSeasonal")
plt.tight_layout(); plt.savefig("TF056_EpidemicSeasonal.png",dpi=300)
~~~
