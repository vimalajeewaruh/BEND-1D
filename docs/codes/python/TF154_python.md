# TF154 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.05*np.ones_like(x)
c=[.18,.36,.52,.64,.73,.795,.842,.876,.902,.922,.938]
for k,ck in enumerate(c,start=1):
    width=.025*(.76**(k-1)); amp=.24*(.93**(k-1))
    f+=amp*((-1)**(k+1))*np.exp(-.5*((x-ck)/width)**2)
f+=.12*x**2*np.sin(2*np.pi*(6*x+45*x**3))
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF154_CompressionStorm.png',dpi=300)
~~~
