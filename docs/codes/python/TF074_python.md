# TF074 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
phase=2*np.pi*(12*x+24*x**2+.5*np.sin(2*np.pi*3*x))
env=.32+.68*np.exp(-.5*((x-.58)/.30)**2)
side=.16*np.sin(2*np.pi*(62*x+3*np.sin(2*np.pi*2*x)))
f=env*np.sin(phase)+side
plt.plot(x,f); plt.grid(alpha=.3); plt.title('TF074 — RadarMicroDoppler'); plt.tight_layout()
plt.savefig('TF074_RadarMicroDoppler.png',dpi=300)
~~~
