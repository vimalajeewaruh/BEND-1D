# TF077 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.25+.08*np.sin(2*np.pi*2*x)+.045*x
f+=.28*(s(.20,.012)-s(.40,.018))+.34*(s(.57,.015)-s(.83,.020))
c=[.235,.275,.338,.615,.658,.705,.774]; a=[.18,.11,.21,.16,.25,.14,.22]
w=[.009,.006,.010,.008,.011,.006,.009]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF077_NetworkTrafficBursts.png',dpi=300)
~~~
