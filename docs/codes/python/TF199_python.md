# TF199 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
S=lambda z,c,w: 1/(1+np.exp(-(z-c)/w))
load_curve=0.15+0.78*S(x,0.22,0.065)-0.62*S(x,0.82,0.035)
gate=S(x,0.46,0.010)-S(x,0.78,0.010)
q=18*(x-0.46); saw=2*(q-np.floor(q))-1
f=load_curve+0.17*gate*saw
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF199 — NetworkCongestionBurst")
plt.show()
~~~
