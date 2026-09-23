# TF155 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w)); g=lambda c,w: np.exp(-.5*((x-c)/w)**2)
f=.12*x+.08*np.log(1+6*x)+.18*np.sqrt(np.abs(x-.16))
f+=.16*(S(.24,.006)-S(.36,.006))-.18*S(.43,.003)
f+=.26*g(.50,.010)+.21*g(.527,.008)-.13*g(.575,.005)
f+=.13*np.sin(2*np.pi*(8*x+24*x**2))*(S(.60,.02)-S(.78,.02))
f+=.16*g(.80,.045)*np.sin(2*np.pi*55*x)
f+=.28*g(.885,.035)-.26*g(.895,.037)+.09*g(.955,.0028)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF155_GrandMishMash.png',dpi=300)
~~~
