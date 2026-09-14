# TF059 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
G = lambda mu,s: np.exp(-0.5*((x-mu)/s)**2)
B = 0.018*np.sin(2*np.pi*1.25*x)+0.010*np.sin(2*np.pi*3.1*x+0.4)
P = 0.12*G(0.18,0.030); Q = -0.16*G(0.365,0.010)
R = 1.05*G(0.392,0.0065); S = -0.28*G(0.418,0.012)
ST = 0.045*(1/(1+np.exp(-90*(x-0.455)))-1/(1+np.exp(-55*(x-0.58))))
T = 0.34*G(0.68,0.060)
f = B+P+Q+R+S+ST+T
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF059 — ECGBeat")
plt.tight_layout(); plt.savefig("TF059_ECGBeat.png",dpi=300)
~~~
