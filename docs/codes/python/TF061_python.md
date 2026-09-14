# TF061 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
B = 0.055*np.sin(2*np.pi*4.2*x+0.3)+0.028*np.sin(2*np.pi*7.1*x-0.5)
env = np.exp(-0.5*((x-0.56)/0.115)**2)
phase = 2*np.pi*(20*x+2.2*(x-0.56)**2)
f = B+0.39*env*np.sin(phase)
plt.plot(x,f,linewidth=1.2); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF061 — EEGSpindle")
plt.tight_layout(); plt.savefig("TF061_EEGSpindle.png",dpi=300)
~~~
