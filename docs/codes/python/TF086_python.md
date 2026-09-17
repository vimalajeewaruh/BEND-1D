# TF086 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); g=lambda c,w: np.exp(-.5*((x-c)/w)**2)
wander=.34+.055*np.sin(2*np.pi*1.4*x+.2)+.035*np.sin(2*np.pi*3.3*x-.6)+.020*x
left=.52*g(.56,.060); right=.52*np.exp(-(x-.56)/.18)*(x>=.56)
flare=left*(x<.56)+right; small=.075*g(.20,.018)+.055*g(.84,.014); f=wander+flare+small
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF086_QuasarFlare.png',dpi=300)
~~~
