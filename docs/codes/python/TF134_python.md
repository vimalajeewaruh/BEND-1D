# TF134 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w)); u=np.maximum(x-.50,0)
f=.25+.08*np.sin(2*np.pi*6*x)+.03*np.sin(2*np.pi*18*x)
f+=.48*np.exp(-.5*((x-.49)/.035)**2)+(x>=.50)*.20*np.exp(-9*u)*np.sin(2*np.pi*15*u)
f+=.12*S(.56,.020)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF134_WindTurbineGustControl.png',dpi=300)
~~~
