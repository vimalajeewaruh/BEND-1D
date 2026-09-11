~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)

# np.sinc(y) = sin(pi*y)/(pi*y)
z = 18*np.pi*(x-0.50)
A = np.sinc(z/np.pi)**2
M = 0.18 + 0.82*np.cos(15*np.pi*(x-0.50))**2

z2 = 34*np.pi*(x-0.67)
S = 0.10*np.sinc(z2/np.pi)**2
f = A*M + S

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF021 — Diffraction")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF021_Diffraction.png", dpi=300)
~~~
