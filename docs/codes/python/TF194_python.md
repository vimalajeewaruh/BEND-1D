# TF194 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
phase1=2*np.pi*(17*x+5*x**2)+1.25*np.sin(2*np.pi*2.7*x)
phase2=2*np.pi*(39*x+2.5*x**2)+0.70*np.sin(2*np.pi*5.2*x)
f=(0.58+0.25*np.cos(2*np.pi*1.8*x))*np.sin(phase1)+0.24*np.sin(phase2)
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF194 — RadarMicroDoppler")
plt.show()
~~~
