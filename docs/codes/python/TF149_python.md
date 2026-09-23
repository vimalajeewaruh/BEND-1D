# TF149 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); f=.02*np.ones_like(x)
c=[.18,.37,.52,.63,.71,.77,.815,.848,.872,.890]
for k,ck in enumerate(c,start=1):
    amp=.30*(.87**(k-1)); width=.025*(.70**(k-1))
    f+=amp*((-1)**(k+1))*np.exp(-.5*((x-ck)/width)**2)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF149_LacunaryCascade.png',dpi=300)
~~~
