# TF214 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
u=np.maximum(x-0.06,0); gate=S(x,0.06,0.002)
f=gate*(0.58*np.exp(-4*u)*np.sin(2*np.pi*8.5*u)+0.40*np.exp(-5.8*u)*np.sin(2*np.pi*13.7*u+0.7)+0.27*np.exp(-7.5*u)*np.sin(2*np.pi*22.4*u+0.3)+0.16*np.exp(-10*u)*np.sin(2*np.pi*31.2*u+1.0))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF214 — DrumModePacket")
plt.show()
~~~
