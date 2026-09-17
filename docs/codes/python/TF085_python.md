# TF085 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
g=lambda c,w: np.exp(-.5*((x-c)/w)**2)
prec=.08*g(.30,.010)+.12*g(.345,.007)+.07*g(.385,.006); rise=.90*s(.46,.008)
u=np.maximum(x-.49,0); decay=(x>=.49)*(.58*np.exp(-5.2*u)+.32*np.exp(-18*u))
f=.08+prec+rise; post=x>=.49; f[post]=.08+decay[post]; f+=.055*g(.64,.018)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF085_SolarFlare.png',dpi=300)
~~~
