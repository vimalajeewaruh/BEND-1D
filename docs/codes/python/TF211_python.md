# TF211 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
u=np.maximum(x-0.035,0); gate=S(x,0.035,0.0025)
f=gate*(0.62*np.exp(-2.2*u)*np.sin(2*np.pi*7*u)+0.34*np.exp(-4.0*u)*np.sin(2*np.pi*14.25*u+0.15)+0.22*np.exp(-6.0*u)*np.sin(2*np.pi*21.7*u+0.4)+0.14*np.exp(-8.0*u)*np.sin(2*np.pi*29.5*u+0.7))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF211 — PianoInharmonicDecay")
plt.show()
~~~
