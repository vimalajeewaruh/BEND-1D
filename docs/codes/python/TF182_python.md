# TF182 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
from scipy.special import erfc
def exg(z,c,s,tau):
    return 0.5*np.exp(s**2/(2*tau**2)-(z-c)/tau)*erfc((s**2/tau-(z-c))/(np.sqrt(2)*s))
e1=exg(x,0.310,0.0045,0.038); e2=exg(x,0.347,0.0032,0.024)
e1/=np.max(e1); e2/=np.max(e2)
f=e1+0.42*e2
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF182 — FRBScatterTail")
plt.show()
~~~
