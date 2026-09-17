# TF095 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
env=s(.07,.025)-s(.93,.030)
ph1=2*np.pi*(8*x+7*x**2); ph2=2*np.pi*(22*x-5*x**2); ph3=2*np.pi*(38*x+4*x**2)
f=env*(.42*np.sin(ph1)+.27*np.sin(ph2+.3)+.14*np.sin(ph3-.5))
f*=.78+.22*np.exp(-.5*((x-.58)/.22)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF095_SpeechFormantTransition.png',dpi=300)
~~~
