# TF057 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
diurnal = 0.36+0.11*np.sin(2*np.pi*7*x-0.5)+0.04*np.sin(4*np.pi*7*x+0.2)
episode1 = 0.62*np.exp(-0.5*((x-0.38)/0.030)**2)
episode2 = 0.42*np.exp(-0.5*((x-0.73)/0.055)**2)
f = diurnal+episode1+episode2
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Concentration"); plt.title("TF057 — PollutionEpisode")
plt.tight_layout(); plt.savefig("TF057_PollutionEpisode.png",dpi=300)
~~~
