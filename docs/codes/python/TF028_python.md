~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0, 1, N)
phase = 2*np.pi*(9*x + 0.06*np.sin(2*np.pi*0.8*x))
pulse = (0.55*np.sin(phase) + 0.23*np.sin(2*phase-0.55)
         + 0.10*np.sin(3*phase-1.00))
onset = 1/(1+np.exp(-65*(x-0.56)))
f = 0.35 + 0.18*pulse + onset*(0.48+0.18*pulse) + 0.035*np.sin(2*np.pi*1.1*x)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF028 — VasospasmTCD")
plt.tight_layout(); plt.savefig("TF028_VasospasmTCD.png",dpi=300)
~~~
