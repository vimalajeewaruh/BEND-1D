# TF100 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
f=.08+.035*np.sin(2*np.pi*1.8*x)
c=[.12,.24,.355,.465,.57,.67,.765,.855,.935]
a=[.70,.64,.58,.54,.49,.45,.42,.39,.36]
for k,(ck,ak) in enumerate(zip(c,a),start=1):
    width=.010+.0025*k; env=np.exp(-.5*((x-ck)/width)**2)
    localOsc=.60*np.sin(2*np.pi*(72*x+.8*k)); f+=ak*env*(.75+.25*localOsc)
f-=.10*s(.52,.12)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF100_NeuralBurstAdaptation.png',dpi=300)
~~~
