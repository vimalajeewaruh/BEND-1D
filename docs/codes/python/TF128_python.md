# TF128 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.10+.03*x
c=[.14,.23,.36,.49,.62,.73,.81]; a=[.16,.28,.42,.26,.54,.31,.18]
w=[.008,.010,.012,.009,.010,.007,.006]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
f+=.07*np.exp(-.5*((x-.655)/.004)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF128_OCTRetinalProfile.png',dpi=300)
~~~
