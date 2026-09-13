# TF050 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
env = 1/(1+np.exp(-55*(x-0.29)))
carrier = np.sin(2*np.pi*(17*x+0.9*x**2))+0.33*np.sin(2*np.pi*35*x+0.4)
burst = 1+0.55*np.exp(-0.5*((x-0.49)/0.045)**2)+0.42*np.exp(-0.5*((x-0.72)/0.035)**2)
f = env*burst*carrier
plt.plot(x,f,linewidth=1.1); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF050 — VolcanicTremor")
plt.tight_layout(); plt.savefig("TF050_VolcanicTremor.png",dpi=300)
~~~
