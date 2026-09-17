# TF090 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
pre=1+.10*x+.025*np.sin(2*np.pi*3*x); crash=-.62*s(.535,.004); rebound=.44*s(.585,.009)
aftershock=-.13*np.exp(-.5*((x-.665)/.015)**2)
u=np.maximum(x-.585,0); normalization=(x>=.585)*.16*(1-np.exp(-4.5*u))
f=pre+crash+rebound+aftershock+normalization
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF090_MarketFlashCrash.png',dpi=300)
~~~
