# TF113 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.10+.025*np.sin(2*np.pi*3*x)+.20*S(.30,.006)-.75*S(.38,.018)
u=np.maximum(x-.47,0); f+=(x>=.47)*.55*(1-np.exp(-3.5*u))
for c in [.52,.61,.69]: f-=.10*np.exp(-.5*((x-c)/.012)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF113_SpaceWeatherStorm.png',dpi=300)
~~~
