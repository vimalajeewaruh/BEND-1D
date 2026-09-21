# TF116 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.10+.018*np.sin(2*np.pi*3*x)
for c in np.arange(.10,.901,.11):
    u=np.maximum(x-c,0); f+=.24*(x>=c)*np.exp(-60*u)*np.sin(2*np.pi*75*u)
f+=.055*np.exp(-.5*((x-.54)/.010)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF116_SideChannelPower.png',dpi=300)
~~~
