# TF069 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
mixed = 1.00-0.025*x
thermo = -0.62/(1+np.exp(-42*(x-0.43)))
deep = -0.14*np.maximum(x-0.46,0)
inversion = 0.075*np.exp(-0.5*((x-0.69)/0.035)**2)
fine = 0.015*np.sin(2*np.pi*10*x)*np.exp(-0.5*((x-0.46)/0.20)**2)
f = mixed+thermo+deep+inversion+fine
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Temperature-like value"); plt.title("TF069 — OceanThermocline")
plt.tight_layout(); plt.savefig("TF069_OceanThermocline.png",dpi=300)
~~~
