# TF036 — Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); shaft = 3.2; mesh = 31
phase = 2*np.pi*mesh*x+0.22*np.sin(2*np.pi*shaft*x)
amp = 0.78+0.22*np.cos(2*np.pi*shaft*x)
carrier = amp*np.sin(phase)+0.20*np.sin(2*phase-0.35)
defect = 0.70*np.exp(-0.5*((x-0.63)/0.035)**2)*np.sin(2*np.pi*36*x+0.8)
f = carrier+defect
plt.plot(x,f,linewidth=1.1); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF036 — GearDefect")
plt.tight_layout(); plt.savefig("TF036_GearDefect.png",dpi=300)
~~~
