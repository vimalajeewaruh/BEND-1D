# TF081 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
baseline=1+.012*np.sin(2*np.pi*1.2*x); W=s(.34,.008)-s(.68,.008)
bottom=-.20*W
limb=-.035*np.exp(-.5*((x-.37)/.022)**2)-.035*np.exp(-.5*((x-.65)/.022)**2)
spot=.050*np.exp(-.5*((x-.535)/.016)**2); f=baseline+bottom+limb+spot
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF081_ExoplanetTransitSpots.png',dpi=300)
~~~
