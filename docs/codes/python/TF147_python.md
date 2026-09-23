# TF147 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
phi_up=2*np.pi*(8*x+20*x**2); phi_down=2*np.pi*(28*x-20*x**2)
amplitude=.75+.25*np.exp(-.5*((x-.50)/.30)**2)
f=amplitude*(.25*np.sin(phi_up)+.25*np.sin(phi_down+.35))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF147_FrequencyCrossing.png',dpi=300)
~~~
