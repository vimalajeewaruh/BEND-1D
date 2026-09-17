# TF087 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
season=.34+.055*x+.065*np.sin(2*np.pi*5*x-.4)+.025*np.sin(2*np.pi*10*x)
promo=.36*(s(.34,.010)-s(.58,.016)); stockout=-.25*(s(.48,.006)-s(.535,.006))
u=np.maximum(x-.58,0); carry=(x>=.58)*.15*np.exp(-8*u); f=season+promo+stockout+carry
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF087_PromoDemand.png',dpi=300)
~~~
