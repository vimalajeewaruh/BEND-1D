# TF150 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024; x=np.linspace(0,1,N); S=lambda c,w: 1/(1+np.exp(-(x-c)/w))
left=.20+.22*np.sin(2*np.pi*2*x); window=S(.33,.008)-S(.68,.008)
rough=.16*np.sin(2*np.pi*17*x)+.08*np.sin(2*np.pi*41*x+.3)+.04*np.sin(2*np.pi*91*x-.2)
right=.20+.18*np.cos(2*np.pi*2*(x-.68))
f=left*(1-S(.33,.008))+window*(.20+rough)+right*S(.68,.008)
plt.plot(x,f); plt.grid(alpha=.3); plt.tight_layout()
plt.savefig('TF150_SmoothRoughSmooth.png',dpi=300)
~~~
