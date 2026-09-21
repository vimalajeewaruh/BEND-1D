# TF123 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N)
broad=.80*np.exp(-.5*((x-.52)/.20)**2)
needle=.085*np.exp(-.5*((x-.565)/.0035)**2)
shoulder=-.04*np.exp(-.5*((x-.61)/.016)**2); f=broad+needle+shoulder
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF123_HiddenNeedle.png',dpi=300)
~~~
