# TF045 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); wavelength = 400+300*x
baseline = 0.72+0.00035*(wavelength-550)
band1 = 0.42*np.exp(-0.5*((wavelength-525)/38)**2)
band2 = 0.16*np.exp(-0.5*((wavelength-585)/24)**2)
shoulder = 0.08*np.exp(-0.5*((wavelength-455)/18)**2)
f = baseline-band1-band2-shoulder
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Reflectance"); plt.title("TF045 — StampReflectance")
plt.tight_layout(); plt.savefig("TF045_StampReflectance.png",dpi=300)
~~~
