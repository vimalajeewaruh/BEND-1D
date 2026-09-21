# TF138 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.03*np.ones_like(x)
c=[.10,.20,.30,.405,.435,.58,.70,.82,.92]; a=[.45,.50,.47,.44,.39,.76,.12,.49,.46]
w=[.015,.014,.016,.013,.013,.030,.012,.015,.014]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF138_MicrofluidicDropletTrain.png',dpi=300)
~~~
