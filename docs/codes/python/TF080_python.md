# TF080 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=1.35*np.exp(-5.8*x)+.24*np.exp(-.65*x)+.065
f-=.065*s(.34,.006)+.045*s(.58,.006)+.028*s(.78,.005)
c=[.27,.47,.705]; a=[.12,.075,.050]; w=[.010,.008,.006]
for ck,ak,wk in zip(c,a,w): f+=ak*np.exp(-.5*((x-ck)/wk)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF080_TrainingLossSchedule.png',dpi=300)
~~~
