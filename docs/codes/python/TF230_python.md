# TF230 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
f=np.zeros_like(x)
intervals=[[0,.2,4,1.00],[.2,.4,3,-.85],[.4,.6,2,.90],[.6,.8,1.5,-.80],[.8,1.0,.5,.65]]
for aa,bb,p,A in intervals:
    m=(x>=aa)&(x<=bb); s=(x[m]-aa)/(bb-aa)
    f[m]=A*(4*s*(1-s))**p
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF230 — RegularityQuilt")
plt.show()
~~~
