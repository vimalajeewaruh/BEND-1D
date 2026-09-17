# TF096 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); s=lambda c,w: 1/(1+np.exp(-(x-c)/w))
amb=.04*np.sin(2*np.pi*4*x); bass=.14*s(.18,.020)*np.sin(2*np.pi*9*x)
harm=.12*s(.38,.025)*np.sin(2*np.pi*23*x+.4); rhythm=np.zeros_like(x)
for c in np.arange(.42,.961,.085):
    u=np.maximum(x-c,0); rhythm+=.20*(x>=c)*np.exp(-70*u)*np.sin(2*np.pi*70*u)
crescendo=.10*x*np.sin(2*np.pi*(14*x+5*x**2)); f=amb+bass+harm+rhythm+crescendo
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF096_AudioIntro.png',dpi=300)
~~~
