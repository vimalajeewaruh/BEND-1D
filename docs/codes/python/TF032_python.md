~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
env = 1/(1+np.exp(-75*(x-0.42)))
amp = 0.78+0.15*np.sin(2*np.pi*1.25*x)
f = (0.025*np.sin(2*np.pi*3*x) + env*amp*(np.sin(2*np.pi*18*x)
     + 0.24*np.sin(2*np.pi*36*x+0.65)))
plt.plot(x,f,linewidth=1.2); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF032 — TremorOnset")
plt.tight_layout(); plt.savefig("TF032_TremorOnset.png",dpi=300)
~~~
