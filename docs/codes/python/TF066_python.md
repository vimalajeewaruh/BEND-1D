# TF066 — PYTHON Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
plateau = 1.05-0.075*x-0.020*x**2
phase_drop = -0.060/(1+np.exp(-55*(x-0.36)))
phase_recover = 0.036/(1+np.exp(-48*(x-0.50)))
shoulder = 0.018*np.exp(-0.5*((x-0.62)/0.050)**2)
terminal = -0.55/(1+np.exp(-48*(x-0.885)))
ripple = 0.006*np.sin(2*np.pi*6*x)*np.exp(-1.2*x)
f = plateau+phase_drop+phase_recover+shoulder+terminal+ripple
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Voltage"); plt.title("TF066 — BatteryDischarge")
plt.tight_layout(); plt.savefig("TF066_BatteryDischarge.png",dpi=300)
~~~
