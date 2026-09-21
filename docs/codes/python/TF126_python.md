# TF126 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
background=.035*np.sin(2*np.pi*3*x)+.015*x
packet=.28*np.exp(-.5*((x-.46)/.075)**2)*np.sin(2*np.pi*(18*x+14*x**2))
echo=.10*np.exp(-.5*((x-.64)/.025)**2)*np.sin(2*np.pi*45*x)
f=background+(1-.25*x)*packet+echo
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF126_DASFiberEvent.png',dpi=300)
~~~
