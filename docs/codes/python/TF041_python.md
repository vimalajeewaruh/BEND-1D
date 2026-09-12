# TF041 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
# from project_helpers import chirp_packet
N = 1024; x = np.linspace(0,1,N)
f = (chirp_packet(x,0.22,0.030,28,145,1.00)
     + chirp_packet(x,0.405,0.036,28,120,0.48)
     + chirp_packet(x,0.545,0.043,26,105,0.28))
u = x-0.56; ind = u>=0; rev = np.zeros_like(x)
rev[ind] = 0.18*np.exp(-5.5*u[ind])*(np.sin(2*np.pi*18*u[ind])
           + 0.35*np.sin(2*np.pi*43*u[ind]+0.5))
f += rev
plt.plot(x,f,linewidth=1.1); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF041 — SonarMultipath")
plt.tight_layout(); plt.savefig("TF041_SonarMultipath.png",dpi=300)
~~~
