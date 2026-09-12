# TF027 — Python Implementation

~~~python
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import PchipInterpolator

N = 1024
x = np.linspace(0, 1, N)
ipd_file = Path("ipd.csv")

if ipd_file.exists():
    z = np.genfromtxt(ipd_file, delimiter=",")
    z = z if z.ndim == 1 else z[:, -1]
    z = z[np.isfinite(z)]
else:
    z = np.array([])

if z.size >= 16:
    f = PchipInterpolator(np.linspace(0, 1, z.size), z)(x)
else:
    phase = 2*np.pi*(10.5*x + 0.20*np.sin(2*np.pi*0.75*x))
    normal = (0.92 + 0.10*np.sin(2*np.pi*0.55*x)) * (
        np.sin(phase) + 0.18*np.sin(2*phase-0.45))
    w = np.exp(-0.5*((x-0.51)/0.105)**2)
    disturb = (0.48*w*np.sin(2*np.pi*(4.1*x+1.6*x**2)+0.6)
               + 0.25*w*np.sin(2*np.pi*31*x)
               + 0.14*w*np.sin(2*np.pi*53*x+0.8))
    f = (1-0.88*w)*normal + disturb

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF027 — NasonPleth")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF027_NasonPleth.png", dpi=300)
~~~

