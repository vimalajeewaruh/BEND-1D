# TF136 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w)); u=np.maximum(x-.30,0)
f=.30+.02*x+.16*S(.30,.006)
f+=(x>=.30)*.34*np.exp(-5*u)*np.sin(2*np.pi*(10*u+4*u**2))-.10*S(.64,.010)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF136_GridInverterOscillation.png',dpi=300)
~~~
